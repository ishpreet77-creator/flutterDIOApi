import 'package:flutter/material.dart';
import '../ApiRequest/Apirequest.dart';
import '../../../NetworkClass/ApiServices/Apiservices.dart';

import '../Model/LoginModel.dart';

//viewModel for logic 
//all login can be write on this class not on the design screen
class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = "";
  String get error => _error;


  PostApiRes? PostUser;
  PostApiRes? get PUser => PostUser;
  Future<void> createUser(User user) async {
    _isLoading = true;
    notifyListeners();
    final newUser = user;
  
    try {
      final response = await _apiService.postRequest('posts', data: newUser.toJson());
      final data = response.data;
      print("Response == > $data");
      PostUser = PostApiRes.fromJson(data);
      
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
