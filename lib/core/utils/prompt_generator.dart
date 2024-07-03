const String promptChat = """You are a Travel Guide, Given an input chat message, your mission is to generate a fitting chat reply. This process involves understanding the context, tone, and intent of the original message and responding appropriately.""";

const String promptTouristPlace = """You are a Travel Guide, Given the inputs of destination {{destination}}, budget {{budget}} (in USD), and duration {{duration}} (in days), generate a JSON response containing a list of 5-10 tourist places. Each place should include its name, latitude, longitude, history, significance, cuisine, specialty, and location. The history and significance should each be at least 60 words long. Ensure the response is in JSON format and does not include any extra text.
json format for 1 tourist place JSON object:
{
    "name": "String",
    "latitude": Double,
    "longitude": Double,
    "history": "String (min 60 words)",
    "significance": "String (min 60 words)",
    "cuisine": "String",
    "specialty": "String",
    "location": "String"
}
""";

const String promptItinerary = """You are a Travel Guide, Given the inputs of destination {{destination}}, budget {{budget}} (in USD), and duration {{duration}} (in days), generate a JSON response containing a itinerary according to the user inputs. The itinerary should include its name, starting point, list of minimum 3 places, and list of travel route accordingly to total places. Each place includes name, location, latitude, longitude, description, and list of highlights of that place. Each travel route should contain mode of transportation, starting point, end point, duration in minutes, list of highlights, and description. Ensure the response is in JSON format and does not include any extra text.
json format for 1 activity JSON object:
{
  "name": "String",
  "startingPoint": "String",
  "travelRoute": TravelRoute[],
  "places": Place[],
}

json format for 1 TravelRoute JSON object:
{
  "mode": "String",
  "from": "String",
  "to": "String",
  "duration": "String",
  "highlights": String[],
  "description": "String",
}

json format for 1 Place JSON object:
{
  "name": "String",
  "location": "String",
  "latitude": "String",
  "longitude": "String",
  "highlights": String[],
  "description": "String",
}
""";

const String promptRecommendations = """You are a Travel Guide, Given the inputs of destination {{destination}}, and travel style {{travel_style}}, generate a JSON response containing a list of 3 recommendations related to the destination and the travel style. Each recommendation should include its name, description, highlights list, duration in minutes, and cost in usd. The description should each be at least 60 words long and highlights should be concise and easy to understand. Ensure the response is in JSON format and does not include any extra text.
json format for 1 recommendation JSON object:
{
  "name": "String",
  "description": String (min 60 words),
  "highlights": String[],
  "duration": "String",
  "cost": "String"
}
""";

const String promptActivities = """You are a Travel Guide, Given the inputs of destination {{destination}}, budget {{budget}} (in USD), and duration {{duration}} (in days), generate a JSON response containing a list of 3 activities related to the destination. Each activity should include its name, description, procedures steps list, precautions list, duration in minutes, and cost in usd. The description should each be at least 60 words long and procedures and precautions should be concise and easy to understand. Ensure the response is in JSON format and does not include any extra text.
json format for 1 activity JSON object:
{
  "name": "String",
  "description": String (min 60 words),
  "procedure": String[],
  "precautions": String[],
  "duration": "String",
  "cost": "String"
}
""";

const String promptBudgetPlan = """You are a Travel Guide, Given the inputs of travel locations {{itinerary}}, budget {{budget}} (in USD), duration {{duration}} (in days), and companions {{companions}} (total number of people traveling with you), generate a JSON response containing a budget plan according to provided user inputs. The budget plan should include its name, starting point, total cost in usd, list of minimum 3 places, and list of travel route, accommodation, additional expenses accordingly to total places. Each place includes name, entranceFee, guidedTourFee, averageMealCost all in usd. Each travel route should contain mode of transportation, starting point, end point, duration in minutes, and cost in usd. Each accommodation include name, description, cost per night in usd, total cost in usd, and duration. Each additional expense includes name, description, and additional cost in usd. Ensure the response is in JSON format and does not include any extra text.
json format for 1 budget plan JSON object:
{
  "name": "String",
  "startingPoint": "String",
  "totalCost": "String",
  "travelRoute": TravelRoute[],
  "places": Place[],
  "accommodation": accommodation[],
  "additionalExpenses": AdditionalExpenses[],
}

json format for 1 TravelRoute JSON object:
{
  "mode": "String",
  "from": "String",
  "to": "String",
  "duration": "String",
  "cost": "String",
  "description": "String",
}

json format for 1 Place JSON object:
{
  "name": "String"
  "entranceFee": "String"
  "guidedTourFee": "String"
  "averageMealCost": "String"
}

json format for 1 AdditionalExpense JSON object:
{
  "name": "String"
  "description": "String"
  "estimatedCost": "String"
}

json format for 1 Accommodation JSON object:
{
  "name": "String"
  "description": "String"
  "costPerNight": "String"
  "duration": "String"
  "totalCost": "String"
}
""";

const String promptLocalCuisine = """You are a Travel Guide, Given the inputs of destination {{destination}}, diet preference {{preference}}, and dietary restrictions {{dietary-restriction}}, generate a JSON response containing a list of 3 local cuisines related to the destination and user dietary preferences and restrictions. Each local cuisine should include its name, aliases list, description, origin, duration in minutes, list of ingredients, and list of recipe steps. The description should each be at least 60 words long and recipe steps should be concise and easy to understand. Ensure the response is in JSON format and does not include any extra text.
json format for 1 local cuisine JSON object:
{
  "name": "String",
  "description": String (min 60 words),
  "duration": "String",
  "origin": "String" (min 60 words),
  "aliases": String[],
  "ingredients": String[],
  "recipe": String[],
}
""";