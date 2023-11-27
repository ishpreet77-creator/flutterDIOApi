import 'package:flutter_dio_http/Screens/HOME/Model/model.dart';

import '../sharedPrefrence/sharedprefrence.dart';

class AppDefault {
  static final shared = AppDefault();

  Future<void> myString(String value) async {
    await MySharedPreferences.saveString('myString', value);
  }

  Future<String> loadData(String key) async {
    var value = await MySharedPreferences.getString(key) ?? '';
    return value;
  }

  Future<void> clear() async {
     await MySharedPreferences.clearAll();
  }
}


class SaveModel {
  Future<void> savemodel(dynamic model) async {
    await MySharedPreferences.saveModel("mymodel", model);
  }

  Future<T?> loadModel<T>(T Function(Map<String, dynamic>) fromJson) async {
    return await MySharedPreferences.getModel("mymodel", fromJson);
  }
}




// // Save a string
// await MySharedPreferences.saveString('myString', 'Hello');

// // Retrieve a string
// final myString = await MySharedPreferences.getString('myString');

// // Save a boolean
// await MySharedPreferences.saveBool('myBool', true);

// // Retrieve a boolean
// final myBool = await MySharedPreferences.getBool('myBool');

// // Save an integer
// await MySharedPreferences.saveInt('myInt', 42);

// // Retrieve an integer
// final myInt = await MySharedPreferences.getInt('myInt');

// // Save a double
// await MySharedPreferences.saveDouble('myDouble', 3.14);

// // Retrieve a double
// final myDouble = await MySharedPreferences.getDouble('myDouble');

// // Save a model
// final myModel = MyModel(name: 'John', age: 25);
// await MySharedPreferences.saveModel('myModel', myModel);

// // Retrieve a model
// final retrievedModel = await MySharedPreferences.getModel<MyModel>('myModel', MyModel.fromJson);