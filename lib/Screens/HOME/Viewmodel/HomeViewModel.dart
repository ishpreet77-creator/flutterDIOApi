import 'package:flutter/material.dart';
import '../../../NetworkClass/ApiServices/Apiservices.dart';
import '../../../Helper/Appdefault/Appdefault.dart';
import '../Model/PersonModel.dart';

class HomeViewModel extends ChangeNotifier {
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

      await AppDefault.shared.saveModel<PersonModel>('user', _users!);

      print(_users?.hairColor);
    } catch (error) {
      _error = error.toString();
      print(_error);
    }
    _isLoading = false;
    notifyListeners();
  }
}
