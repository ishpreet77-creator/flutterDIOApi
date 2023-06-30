import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animation/loader.json',
        width: 300,
        height: 200,
      ),
    );
  }
}

class ErrorToast extends StatelessWidget {
  final String error;

  const ErrorToast({required this.error});

  @override
  Widget build(BuildContext context) {
    showErrorToast(context, error);
    return Container(); // Placeholder widget, can be replaced with an appropriate UI for the toast
  }

  void showErrorToast(BuildContext context, String errorMessage) {
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
