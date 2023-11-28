import 'package:flutter/material.dart';

class StaticColors {
  static LoginScreen login_screen = LoginScreen();
  
  LinearGradient splashGradient = LinearGradient(
  colors: [
    Color.fromRGBO(253, 90, 71, 1.0),
    Color.fromRGBO(253, 119, 70, 1.0)
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);


}

class LoginScreen {
  //TODO:-  RGB colors
  static Color appColor = Color.fromRGBO(22, 143, 254, 1.0);
  //TODO:-  HEX color
  static Color yellowDarkColor = Color(0xFFFFC107);
}

class HexColor extends Color {
  static int getcolorfromHex(String hexcolor) {
    hexcolor = hexcolor.toUpperCase().replaceAll("#", "");
    if (hexcolor.length == 6) {
      hexcolor = "FF" + hexcolor;
    }
    return int.parse(hexcolor, radix: 16);
  }

  HexColor(final String hexColor) : super(getcolorfromHex(hexColor));
}