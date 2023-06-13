import 'package:flutter/material.dart';
import '../ApiRequest/Apirequest.dart';
import '../ApiServices/Apiservices.dart';

import '../Model/model.dart';

class UserViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = "";
  String get error => _error;

  PersonModel? _users;
  PersonModel? get users => _users;
  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = "";
    notifyListeners();
    try {
      final response = await _apiService.getRequest<Map<String, dynamic>>('people/1');
      final data = response.data;
      _users = PersonModel.fromJson(data!);
    } catch (error) {
      _error = error.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  PostApiRes? PostUser;
  PostApiRes? get PUser => PostUser;
  Future<void> createUser(User user) async {
    _isLoading = true;
    notifyListeners();
    final newUser = user;
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      final response = await _apiService.postRequest('posts', data: newUser.toJson(), headers: headers);
      final data1 = response.data;
      PostUser = PostApiRes.fromJson(data1!);
      print(data1);
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
