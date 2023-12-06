import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'Screens/Splash.dart';
import 'providerBinding/ProviderBinding.dart';

var Checkinternet = true;
void main() async {
  runApp(callproviders());
  checkInternet();
}

void checkInternet() {
  InternetConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        print('Data connection is available.');
        Checkinternet = true;
        break;
      case InternetConnectionStatus.disconnected:
        print('You are disconnected from the internet.');
        Checkinternet = false;
        break;
    }
  });
}

Widget callproviders() {
  return MultiProvider(
    providers: providerarray,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    ),
  );
}
