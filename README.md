# LG Gemini AI Touristic Tool

AI-powered tourism app with multiple features.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [FAQ](#faq)
  - [How to Use AI Features](#how-to-use-ai-features)
  - [How to Connect with Liquid Galaxy](#how-to-connect-with-liquid-galaxy)
- [Contribution](#contribution)
  - [Add Google Maps Key in Manifest](#add-google-maps-key-in-manifest)

## Overview

AI-powered Flutter app makes it simple to explore tourism information. Connected to the Liquid Galaxy system, the app allows users to ask questions about tourist spots using a chat interface or voice commands. It provides personalized itineraries, recommends tourist places, and explains the history and significance of each location.

## Features

- Chat and voice commands for querying tourist information.
- Personalized itineraries and tourist place recommendations.
- Integration with Liquid Galaxy for orbits and balloons.
- Multi-modal interactions through images, text, and voice-to-text.
- Easy-to-use prompts like "What to Eat" and "Find Tourist Place."

## Usage

1. Install the app on your device.
2. Add your Gemini API key in input given in Settings.
3. Connect to the Liquid Galaxy system via the Connection Manager in Settings.
4. Use the chat or any features you like.
5. Explore places through the Liquid Galaxy visualization.

## Screenshots

| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/1.png)| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/2.png)| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/3.png)|
| ---- | ---- | ---- | 
| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/4.png)| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/5.png)| ![s](https://github.com/LiquidGalaxyLAB/LG-Gemini-AI-Touristic-info-tool/blob/main/images/6.png)|

## FAQ

### How to Use AI Features
To use AI features of the app you provide the API_KEY.

1. Go to [Gemini API](https://aistudio.google.com/app/apikey).
2. Create a NEW API key.
3. Copy the API_KEY and paste it under General Settings in app.

### How to Connect with Liquid Galaxy

1. Open the Connection Manager screen in the app.
2. Enter the required credentials for the Liquid Galaxy system.
3. Once connected, you can start using the orbit and tour features to explore locations visually.

## Contribution

### Clone the Project

To contribute to the project, start by cloning the repository:
```bash
git clone https://github.com/yourusername/lg-gemini-ai-touristic-tool.git
cd lg-gemini-ai-touristic-tool
```

### Add Google Maps Key in Manifest
1. After cloning the project, follow these steps to add a Google Maps key:

2. Obtain your Google Maps API key from the Google Cloud Console.

3. Open the AndroidManifest.xml file in your Flutter project.

4. Add the following line inside the <application> tag:
```
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
```

5. Replace YOUR_GOOGLE_MAPS_API_KEY with your actual key.
