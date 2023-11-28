
import 'package:flutter/cupertino.dart';

import '../ExportFile/Export.dart';



class BaseClass {
  static var baseclass = BaseClass();

  //TODO :-  email validation
  bool isValidEmail(String value) {
    String pattern = '^(([^<>()[\\]\\.,;:\\s@\"]+(\\.[^<>()[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))\$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

// TODO :- Toast
  void showErrorToast(String errorMessage) {
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

  //TODO :- Push Screen
  void PushScreen2(BuildContext context, SecondScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: SecondScreen,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }
   void Pushreplacement(BuildContext context, SecondScreen) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: SecondScreen,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  void PushScreen(BuildContext context, SecondScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen),
    );
  }
  //TODO :- back to screen

  void PopScreen(BuildContext context) {
    Navigator.pop(context);
  }

//TODO:- Show alert with single button
  void showAlert(BuildContext context, String title, String message, String actionButtonName, double ButtonfontSize, double messageFontSize, double titleFontSize) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                actionButtonName,
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center(child: Text(title)),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text(
                  actionButtonName,
                  style: TextStyle(fontSize: ButtonfontSize),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      );
    }
  }

//TODO: SHOW ALERT ACTION WITH OK ACTION
  void showAlertWithTwoButton(BuildContext context, String title, String message, double ButtonfontSize, double messageFontSize, double titleFontSize, {VoidCallback? OKPressed}) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: OKPressed != null ? OKPressed : () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: titleFontSize),
          )),
          content: Text(
            message,
            style: TextStyle(fontSize: messageFontSize),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: ButtonfontSize),
              ),
              onPressed: OKPressed != null ? OKPressed : () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }
}
