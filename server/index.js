const express = require("express");
const axios = require("axios");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());

const PORT = process.env.PORT || 3001;
const NEWS_API_KEY = process.env.NEWS_API_KEY;

if (!NEWS_API_KEY) {
  console.error("NEWS_API_KEY is missing in the .env file");
  process.exit(1);
}

app.get("/", async (req, res) => {
  try {
    const category = req.query.category || "general";
    console.log(`Fetching news for category: ${category}`);

    const response = await axios.get(
      `https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=${NEWS_API_KEY}`
    );

    res.json(response.data);
  } catch (error) {
    console.error(
      "Error fetching news:",
      error.response?.data || error.message
    );
    res.status(500).json({ error: "Failed to fetch news" });
  }
});

app.listen(3001, "0.0.0.0", () => {
  console.log("Server running on port 3001");
});
