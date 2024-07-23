import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisine.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendation.dart';
import '../../domain/model/tourist_place.dart';

class BalloonUtils {
  String createBalloonForBudgetPlan(BudgetPlan budgetPlan) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Budget Plan Data</name>
      <Style id="budget_plan_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${budgetPlan.name}</h1>
            <h3>Starting Point:</h3>
            <p>${budgetPlan.startingPoint}</p>
            <h3>Travel Route:</h3>
            <p>${budgetPlan.travelRoute.map((route) => 'Mode: ${route.mode}, From: ${route.from}, To: ${route.to}, Cost: ${route.cost}, Duration: ${route.duration}').join('<br/>')}</p>
            <h3>Places:</h3>
            <p>${budgetPlan.places.map((place) => 'Name: ${place.name}, Entrance Fee: ${place.entranceFee}, Guided Tour Fee: ${place.guidedTourFee}, Average Meal Cost: ${place.averageMealCost}').join('<br/>')}</p>
            <h3>Accommodation:</h3>
            <p>${budgetPlan.accommodation.map((acc) => 'Name: ${acc.name}, Description: ${acc.description}, Cost Per Night: ${acc.costPerNight}, Duration: ${acc.duration}, Total Cost: ${acc.totalCost}').join('<br/>')}</p>
            <h3>Additional Expenses:</h3>
            <p>${budgetPlan.additionalExpenses.map((exp) => 'Name: ${exp.name}, Description: ${exp.description}, Estimated Cost: ${exp.estimatedCost}').join('<br/>')}</p>
            <h3>Total Cost:</h3>
            <p>${budgetPlan.totalCost}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#budget_plan_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${budgetPlan.places[0].latitude},${budgetPlan.places[0].longitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }

  String createBalloonForItinerary(Itinerary itinerary) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Itinerary Data</name>
      <Style id="itinerary_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${itinerary.name}</h1>
            <h3>Starting Point:</h3>
            <p>${itinerary.startingPoint}</p>
            <h3>Travel Route:</h3>
            <p>${itinerary.travelRoute.map((route) => 'Mode: ${route.mode}, From: ${route.from}, To: ${route.to}, Description: ${route.description}, Duration: ${route.duration}, Highlights: ${route.highlights.join(', ')}').join('<br/>')}</p>
            <h3>Places:</h3>
            <p>${itinerary.places.map((place) =>'Name: ${place.name}, Location: ${place.location}, Latitude: ${place.latitude}, Longitude: ${place.longitude}, Description: ${place.description}, Highlights: ${place.highlights.join(', ')}').join('<br/>')}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#itinerary_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${itinerary.places[0].latitude},${itinerary.places[0].longitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }

  String createBalloonForTouristPlace(TouristPlace place) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Tourist Place Data</name>
      <Style id="tourist_place_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${place.name}</h1>
            <h3>Location:</h3>
            <p>${place.location}</p>
            <h3>Coordinates:</h3>
            <p>${place.latitude}, ${place.longitude}</p>
            <h3>History:</h3>
            <p>${place.history}</p>
            <h3>Significance:</h3>
            <p>${place.significance}</p>
            <h3>Cuisine:</h3>
            <p>${place.cuisine}</p>
            <h3>Specialty:</h3>
            <p>${place.specialty}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#tourist_place_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${place.longitude},${place.latitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }

  String createBalloonForCuisine(Cuisine cuisine) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Cuisine Data</name>
      <Style id="cuisine_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${cuisine.name}</h1>
            <h3>Aliases:</h3>
            <p>${cuisine.aliases.join(', ')}</p>
            <h3>Description:</h3>
            <p>${cuisine.description}</p>
            <h3>Origin:</h3>
            <p>${cuisine.origin}</p>
            <h3>Duration:</h3>
            <p>${cuisine.duration}</p>
            <h3>Ingredients:</h3>
            <p>${cuisine.ingredients.join('<br/>')}</p>
            <h3>Recipe:</h3>
            <p>${cuisine.recipe.join('<br/>')}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#cuisine_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${cuisine.longitude},${cuisine.latitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }

  String createBalloonForRecommendation(Recommendation recommendation) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Recommendation Data</name>
      <Style id="recommendation_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${recommendation.name}</h1>
            <h3>Description:</h3>
            <p>${recommendation.description}</p>
            <h3>Cost:</h3>
            <p>${recommendation.cost}</p>
            <h3>Duration:</h3>
            <p>${recommendation.duration}</p>
            <h3>Highlights:</h3>
            <p>${recommendation.highlights.join('<br/>')}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#recommendation_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${recommendation.longitude},${recommendation.latitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }

  String createBalloonForActivity(Activity activity) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Activity Data</name>
      <Style id="activity_style">
        <BalloonStyle>
          <textColor>ffffffff</textColor>
          <text>
            <h1>${activity.name}</h1>
            <h3>Description:</h3>
            <p>${activity.description}</p>
            <h3>Procedure:</h3>
            <p>${activity.procedure.join('<br/>')}</p>
            <h3>Precautions:</h3>
            <p>${activity.precautions.join('<br/>')}</p>
            <h3>Duration:</h3>
            <p>${activity.duration}</p>
            <h3>Cost:</h3>
            <p>${activity.cost}</p>
          </text>
          <bgColor>ff15151a</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description></description>
        <styleUrl>#activity_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${activity.longitude},${activity.latitude},0</coordinates>
        </Point>
      </Placemark>
    </Document>
   </kml>''';
  }

  String emptyBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
       <name>None</name>
       <Style id="blank">
         <BalloonStyle>
           <textColor>ffffffff</textColor>
           <text></text>
           <bgColor>ff15151a</bgColor>
         </BalloonStyle>
       </Style>
       <Placemark id="bb">
         <description></description>
         <styleUrl>#blank</styleUrl>
         <gx:balloonVisibility>0</gx:balloonVisibility>
         <Point>
           <coordinates>0,0,0</coordinates>
         </Point>
       </Placemark>
      </Document>
    </kml>''';
  }
}
