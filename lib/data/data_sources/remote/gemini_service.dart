import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:touristic/domain/model/chat_item.dart';

import '../../model/response/activities_response.dart';
import '../../model/response/budget_plan_response.dart';
import '../../model/response/itinerary_response.dart';
import '../../model/response/local_cuisines_response.dart';
import '../../model/response/recommendations_response.dart';
import '../../model/response/tourist_places_response.dart';

class GeminiService {
  final GenerativeModel model;

  const GeminiService(this.model);

  Future<TouristPlacesResponse?> getTouristPlaces(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return TouristPlacesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<ItineraryResponse?> getItinerary(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return ItineraryResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<LocalCuisinesResponse?> getLocalCuisine(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return LocalCuisinesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<ActivitiesResponse?> getActivities(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return ActivitiesResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<BudgetPlanResponse?> getBudgetPlan(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return BudgetPlanResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<RecommendationsResponse?> getRecommendations(Map<String, dynamic> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    if (response.text != null) {
      final json = jsonDecode(response.text!);
      return RecommendationsResponse.fromJson(json);
    } else {
      return null;
    }
  }

  Future<String?> getChatReply(List<ChatItem> params) async {
    debugPrint("$params");
    final response = await model.generateContent([Content.text("text")]);
    return response.text;
  }
}