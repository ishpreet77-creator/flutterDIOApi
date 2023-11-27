import 'package:flutter/material.dart';
import '../../../NetworkClass/ApiServices/Apiservices.dart';
import '../../../Helper/Appdefault/Appdefault.dart';
import '../Model/model.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _error = "";
  String get error => _error;
  var saveModel = SaveModel();

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
      print(_users?.hairColor);
      // await saveModel.savemodel(_users); 
    } catch (error) {
      _error = error.toString();
      print(_error);
    }
    _isLoading = false;
    notifyListeners();
  }
}
