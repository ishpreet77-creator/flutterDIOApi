import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Splash.dart';
import 'providerBinding/ProviderBinding.dart';

void main() {
  runApp(callproviders());
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
