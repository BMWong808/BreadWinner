import './App.css';
import React, {useState, useEffect} from 'react';
import {APIProvider, Map, Marker, InfoWindow} from '@vis.gl/react-google-maps';
import useNearbyPlaces from './useNearbyPlaces';

function App() {
    const {places, loading} = useNearbyPlaces(51.380255886940496, -2.328219841350826);
    const [userLocation, setUserLocation] = useState(null);

    const activities_database = [
        { id: 1, name: 'Museum', google: 'museum', cost: 15 },
        { id: 2, name: 'Movies', google: 'movie_theater', cost: 12 },
        { id: 3, name: 'Park', google: 'park', cost: 0 },
        { id: 4, name: 'Coffee shop', google: 'cafe', cost: 5 },
        { id: 5, name: 'Hiking', google: 'hiking_area', cost: 4}
    ];

    const [selectedActivity, setSelectedActivity] = useState('');
    const [budget, setBudget] = useState('');
    const [filteredPlaces, setFilteredPlaces] = useState([]);
    const [error, setError] = useState('');
    const [selectedPlace, setSelectedPlace] = useState(null);

    const handleActivityChange = (event) => {
        setSelectedActivity(event.target.value);
    };

    const handleBudgetChange = (event) => {
        setBudget(event.target.value);
    };

    const handleSubmit = (event) => {
        event.preventDefault();
        console.log('Selected Activity: ', selectedActivity);
        console.log('Selected Budget: ', budget);

        if (!selectedActivity) {
            setError('Please select an activity');
            return;
        }

        if (!budget || isNaN(budget) || budget <= 0) {
            setError('Please enter a valid budget') ;
            return;
        }

        places.forEach(place => {
            if (place.types) {
                console.log(place.types);  // Check if types exist before using
            } else {
                console.log("Types not found for this place:", place);
            }
        });

        const filteredResults = places.filter((place) => {
            //const priceLevel = place.price_level || 0;
            //const matchesBudget = priceLevel <= budget;
            return place.types.includes(selectedActivity);;
        });

        setFilteredPlaces(filteredResults);
    }

    useEffect( () => {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    setUserLocation({
                        lat: position.coords.latitude,
                        lng: position.coords.longitude,
                    });
                    console.log("User location:", position.coords.latitude, position.coords.longitude);
                },
                (error) => console.error("Error getting user location:", error),
                { enableHighAccuracy: true }
            );
        } else {
            console.error("Geolocation is not supported.");
        }
    }, []);

    return (
    <div className="App">
        <div className="split-container">
            <div className="prefernces-container-left">
                <h1>Select an activity and budget</h1>
                <div className="form">
                    <form onSubmit={handleSubmit}>
                        <div>
                            <label htmlFor={"activity"}>Select Activity</label>
                            <select id="activity" value={selectedActivity} onChange={handleActivityChange}>
                                <option value="">Choose an activity</option>
                                {activities_database.map((activity) => (
                                    <option key={activity.id} value={activity.google}>{activity.name}</option>
                                ))}
                            </select>
                        </div>

                        <div>
                            <label htmlFor={"activity"}>Select Budget</label>
                            <input
                            type="number"
                            id="budget"
                            value={budget}
                            onChange={handleBudgetChange}
                            placeholder={"Enter your maximum budget"}
                            min="0"
                            />
                        </div>

                        <button type="submit">Submit</button>
                    </form>
                </div>

                <div className="suggested-activities">
                    <h2>Suggested Activities</h2>
                    {filteredPlaces.length === 0 ? (
                        <p>No activities found within your budget or selected activity.</p>
                    ) : (
                        <ul>
                            {filteredPlaces.map((place) => (
                                <li key={place.place_id}>
                                    <p>{place.name}: {place.vicinity}</p>
                                </li>
                            ))}
                        </ul>
                    )}
                </div>

            </div>
            <div className="map-container-right">
                <APIProvider apiKey={'AIzaSyA4CJoS0fA9UFoeaeG_XfXJ_NGAkq8SfkA'} onLoad={() => console.log('API loaded')}>
                    <Map
                        defaultZoom={13}
                        center={{ lat: 51.377594, lng: -2.373032 }}
                        onClick={() => setSelectedPlace(null)}
                        gestureHandling="auto"
                        onCameraChanged={ (ev) =>
                            console.log('camera changed:', ev.detail.center, 'zoom:', ev.detail.zoom)
                        }>
                        {!loading &&
                            filteredPlaces.map(place => (
                                <Marker
                                    key={place.place_id}
                                    position={{lat: place.geometry.location.lat, lng: place.geometry.location.lng }}
                                    title={place.name}
                                    onClick={() => setSelectedPlace(place)}
                                ></Marker>
                            ))}

                        {userLocation && (
                            <Marker
                                position={userLocation}
                                title = "You are here"
                                icon = {{
                                url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                                scaledSize: new window.google.maps.Size(40, 40),
                            }}
                            />
                        )}
                        {selectedPlace && (
                            <InfoWindow
                                position={{lat: selectedPlace.geometry.location.lat,
                                    lng: selectedPlace.geometry.location.lng
                                }}
                                onCloseClick={() => setSelectedPlace(null)}
                            >
                                <div>
                                    <h3 style={{ color: 'black' }}>{selectedPlace.name || "No Name Available"}</h3>
                                    {selectedPlace.rating && <p style={{ color: 'black' }}>Rating: {selectedPlace.rating} / 5</p>}
                                    <p style={{ color: 'black' }}>{selectedPlace.vicinity}</p>
                                    {selectedPlace.photos && (
                                        <img
                                            src={`https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photoreference=${selectedPlace.photos[0].photo_reference}&key=AIzaSyDuZv-GlHTcihgjVojTXI3v170aAK6Z3mc`}
                                            alt={selectedPlace.name}
                                            style={{ width: '100px', height: '100px' }}
                                        />
                                    )}
                                </div>
                            </InfoWindow>
                        )}
                    </Map>
                </APIProvider>
            </div>
        </div>
    </div>
  );
}

export default App;
