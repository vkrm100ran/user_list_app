import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<User> _allUsers = [];
  String _searchQuery = '';

  List<User> get users {
    if (_searchQuery.isEmpty) return _allUsers;
    return _allUsers
        .where((user) =>
            user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.email.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {
          'User-Agent': 'FlutterApp',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        _allUsers = data.map((user) => User.fromJson(user)).toList();
        notifyListeners();
      } else {
        print('Failed to load users. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('error fetching users : $e');
    }
  }

  void addUser(User user) {
    _allUsers.add(user);
    notifyListeners();
  }
}
