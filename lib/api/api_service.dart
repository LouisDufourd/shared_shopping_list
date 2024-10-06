import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_shopping_list/api/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://127.0.0.1:8080/api";

  Future<LoginResponse> login(String username, String password) async {
    final response = await http.get(Uri.parse("$baseUrl/user/login/$username/$password"));

    if(response.statusCode == 200) {
      if (kDebugMode) {
        print("login : ${response.body}");
      }
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      return LoginResponse(false);
    }
  }

  Future<UserHomesResponse> getUserHouseholds(String username) async {
    final response = await http.get(Uri.parse("$baseUrl/user/homes/$username"));

    if(response.statusCode == 200) {
      if (kDebugMode) {
        print("households : ${response.body}");
      }
      return UserHomesResponse.fromJson(jsonDecode(response.body));
    } else {
      return UserHomesResponse(List.empty());
    }
  }

  Future<HomeUsersResponse> getHouseholdUsers(String name) async {
    final response = await http.get(Uri.parse("$baseUrl/home/users/$name"));

    if(response.statusCode == 200) {
      if (kDebugMode) {
        print("users : ${response.body}");
      }
      return HomeUsersResponse.fromJson(jsonDecode(response.body));
    } else {
      return HomeUsersResponse(List.empty());
    }
  }

  Future<ShoppingListResponse> getShoppingList(String name) async {
    final response = await http.get(Uri.parse("$baseUrl/shoppingList/$name"));

    if(response.statusCode == 200) {
      if (kDebugMode) {
        print("shoppingList : ${response.body}");
      }
      return ShoppingListResponse.fromJson(jsonDecode(response.body));
    } else {
      return ShoppingListResponse(List.empty());
    }
  }
}