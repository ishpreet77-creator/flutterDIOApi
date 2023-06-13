import 'package:flutter/material.dart';
import '../ApiRequest/Apirequest.dart';
import '../ApiServices/Apiservices.dart';

import '../Model/model.dart';

class UserViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String _error = "";
  bool get isLoading => _isLoading;
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
      final person = PersonModel.fromJson(data!);
      _users = person;
    } catch (error) {
      _error = error.toString();
    }
    _isLoading = false;
    notifyListeners();
  }


  Future<void> createUser(User user) async {
    _isLoading = true;
    notifyListeners();
    final newUser = user;
    try {
      final response = await _apiService.postRequest('users', data: newUser.toJson());
 final data = response.data;
//  final person = PersonModel.fromJson(data!);
      print(data);
    } catch (error) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
