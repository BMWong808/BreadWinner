import express from "express";
import cors from "cors";
import fetch from "node-fetch";

const app = express();
const PORT = 5000;
const API_KEY = "AIzaSyDuZv-GlHTcihgjVojTXI3v170aAK6Z3mc"; // Replace with your actual key

const types = ['museum', 'park', 'hiking_area', 'cafe', 'movie_theater']

app.use(cors());
app.use(express.json());

app.get("/api/nearby-places", async (req, res) => {
    const {lat, lon} = req.query;

    if (!lat || !lon) {
        return res.status(400).json({error: "Missing lat or lon parameters"});
    }

    try {
        const fetchResponse = types.map(type =>
        fetch(`https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lon}&radius=5000&type=${type}&key=${API_KEY}`)
            .then(response => response.json())
            .then(data => data.results || []) // Ensure we get an array even if empty
        );
        const resultsArray = await Promise.all(fetchResponse);
        const allResults = resultsArray.flat();
        res.json(allResults);
        console.log("Google API Response:", JSON.stringify(allResults, null, 2));
    } catch (error) {
        console.error("Error fetching places:", error);
        res.status(500).json({error: "Internal Server Error"});
    }
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
