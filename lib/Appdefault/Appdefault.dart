import '../sharedPrefrence/sharedprefrence.dart';

//   class Value {
//   static var value;

//   static void setString(dynamic newValue) async {
//     await MySharedPreferences.saveString('myString', newValue);
//     value = newValue;
//   }

//   static Future<void> getString() async {
//     // Retrieve the string using MySharedPreferences
//     value = await MySharedPreferences.getString('myString') ?? '';
//   }
// }

class Value {
  static var _value;

  static Future<void> setString(String newValue) async {
    await MySharedPreferences.saveString('myString', newValue);
    _value = newValue;
  }

  static String getString() {
    return _value;
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