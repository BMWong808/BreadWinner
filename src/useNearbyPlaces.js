import {useState, useEffect} from 'react';

const API_KEY = 'AIzaSyA4CJoS0fA9UFoeaeG_XfXJ_NGAkq8SfkA';

const useNearbyPlaces = (lat, lon) => {
    const [places, setPlaces] = useState([])
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const  fetchPlaces = async () => {
            setLoading(true);
            const url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lon}&radius=5000&type=restaurant&opennow=true&key=${API_KEY}";

            try{
                const response = await fetch(url);
                const data = await response.json();
                setPlaces(data.results || []);
            } catch (error) {
                console.log(error);
            }
            setLoading(false);
        };

        fetchPlaces();
    }, [lat, lon]);

    return {places, loading};
};

export default useNearbyPlaces;