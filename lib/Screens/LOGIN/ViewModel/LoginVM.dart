import 'package:flutter/material.dart';
import '../ApiRequest/Apirequest.dart';
import '../../../NetworkClass/ApiServices/Apiservices.dart';
import '../../../Helper/Appdefault/Appdefault.dart';
import '../Model/LoginModel.dart';

//viewModel for logic 
//all login can be write on this class not on the design screen
class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = "";
  String get error => _error;
  var saveModel = SaveModel();

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
