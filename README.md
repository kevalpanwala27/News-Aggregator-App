# News Aggregator App

A Flutter-based news aggregator app designed to fetch the latest news, provide category filtering, and search functionality. It leverages **Flutter**, **GetX** for state management, **News API** for fetching news, and **URL Launcher** to open full articles in the browser.

## Features

- **Fetches Latest News Dynamically**: Retrieves news articles in real-time.
- **Category Filtering**: Supports filtering by categories such as General, Business, Sports, Tech, etc.
- **Infinite Scrolling with Pagination**: Allows users to scroll through news articles seamlessly with pagination support.
- **Dark \& Light Mode Support**: Offers both dark and light themes for user preference.
- **Read Full Articles in Browser**: Opens full news articles in the browser using URL Launcher.
- **Smooth UI with GetX State Management**: Utilizes GetX for efficient state management and a smooth user interface.


## Technologies Used

- **Flutter (Dart)**: Cross-platform UI toolkit for building natively compiled applications.
- **GetX**: A state management library for Flutter that simplifies app development.
- **News API**: Used for fetching news articles.
- **URL Launcher**: Opens URLs in the browser.
- **Node.js \& Express (Optional)**: Can be used for creating a backend API proxy.


## Installation

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/news-aggregator-app.git
cd news-aggregator-app
```


### 2️⃣ Install Flutter Dependencies

Ensure you have Flutter installed on your system. Then, install the required packages by running:

```bash
flutter pub get
```


### 3️⃣ Set Up Node.js Server (Optional)

If you're using a backend API proxy with Node.js \& Express, follow these steps:

1. **Navigate to the Server Directory**:

```bash
cd server
```

2. **Install Node.js Packages**:

```bash
npm install
```

3. **Run the Node.js Server**:

```bash
node index.js
```


### 4️⃣ Run the Flutter App

To run the app, use the following command from the root directory:

```bash
flutter run
```


### 5️⃣ Obtain News API Key

Sign up at [News API](https://newsapi.org/) to get your API key. Replace the placeholder in your code with your actual API key.
