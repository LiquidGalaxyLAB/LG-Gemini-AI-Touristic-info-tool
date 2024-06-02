import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../model/response/activities_response.dart';
import '../../model/response/budget_plan_response.dart';
import '../../model/response/itinerary_response.dart';
import '../../model/response/local_cuisines_response.dart';
import '../../model/response/recommendations_response.dart';
import '../../model/response/tourist_places_response.dart';

class GeminiService {
  final GenerativeModel model;

  const GeminiService(this.model);

  Future<TouristPlacesResponse?> getTouristPlaces() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return TouristPlacesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<ItineraryResponse?> getItinerary() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return ItineraryResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<LocalCuisinesResponse?> getLocalCuisine() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return LocalCuisinesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<ActivitiesResponse?> getActivities() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return ActivitiesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<BudgetPlanResponse?> getBudgetPlan() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return BudgetPlanResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<RecommendationsResponse?> getRecommendations() async {
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return RecommendationsResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<String?> getChatReply() async {
    final response = await model.generateContent([Content.text("text")]);
    return response.text;
  }
}