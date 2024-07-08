import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/enums/app_feature.dart';
import '../../../core/utils/prompt_generator.dart';
import '../../../domain/model/chat_item.dart';
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
    String? prompt = PromptGenerator.generate(params, AppFeature.touristPlace);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return TouristPlacesResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<ItineraryResponse?> getItinerary(Map<String, dynamic> params) async {
    String? prompt = PromptGenerator.generate(params, AppFeature.itinerary);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return ItineraryResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<LocalCuisinesResponse?> getLocalCuisine(Map<String, dynamic> params) async {
    String? prompt = PromptGenerator.generate(params, AppFeature.localCuisine);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return LocalCuisinesResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<ActivitiesResponse?> getActivities(Map<String, dynamic> params) async {
    String? prompt = PromptGenerator.generate(params, AppFeature.activities);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return ActivitiesResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<BudgetPlanResponse?> getBudgetPlan(Map<String, dynamic> params) async {
    String? prompt = PromptGenerator.generate(params, AppFeature.budgetPlan);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return BudgetPlanResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<RecommendationsResponse?> getRecommendations(Map<String, dynamic> params) async {
    String? prompt = PromptGenerator.generate(params, AppFeature.recommendation);
    if (prompt != null) {
      final response = await model.generateContent([Content.text(prompt)]);
      log("${response.text}");
      if (response.text != null) {
        final json = jsonDecode(response.text!);
        return RecommendationsResponse.fromJson(json);
      }
    }
    return null;
  }

  Future<String?> getChatReply(List<ChatItem> params) async {
    final question = params.removeLast();
    final history = params.map((item) {
      return Content(item.isMe ? "user" : "model", [TextPart(item.message)]);
    }).toList();

    final chatSession = model.startChat(history: history);
    final response = await chatSession.sendMessage(
      Content(
        "user",
        [TextPart(question.message)],
      ),
    );
    log("${response.text}");
    return response.text;
  }
}
