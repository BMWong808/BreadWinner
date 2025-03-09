import {useState, useEffect} from 'react';

const useNearbyPlaces = (lat, lon) => {
    const [places, setPlaces] = useState([])
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        const  fetchPlaces = async () => {
            setLoading(true);

            try{
                const response = await fetch(`http://localhost:5000/api/nearby-places?lat=${lat}&lon=${lon}`);
                const data = await response.json();
                setPlaces(data || []);
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