/*
import 'package:flutter/material.dart' hide Colors, MaterialColor;
import 'package:flutter/material.dart' as material show Colors, MaterialColor;

class Colors {
  static const background = Color.fromRGBO(249, 249, 249, 1.0); //#a1c012
  static const shadow = Color.fromARGB(0xFF, 0xc8, 0xc7, 0xc7);
  static const white = material.Colors.white;
  static const greyDark = Color.fromARGB(0xFF, 0x99, 0x99, 0x99);
  static const greyEE = Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE);
  static const greyDD = Color.fromARGB(0xFF, 0xDD, 0xDD, 0xDD);
  static const grey = material.Colors.grey;
  static const black = material.Colors.black;
  static const red = material.Colors.red;
  static const green = Color.fromARGB(0xFF, 0xa1, 0xc0, 0x12); //#a1c012

  // Þessi gildi eru algerlega röng. Afritað úr flutter basanum.
  // Í staðinn nota creatMaterialColor til að framleiða.
  //
  //static const material.MaterialColor green = material.MaterialColor(
  //  _greenPrimaryValue,
  //  <int, Color>{
  //    50: Color(0xFFEFEBE9),
  //    100: Color(0xFFD7CCC8),
  //    200: Color(0xFFBCAAA4),
  //    300: Color(0xFFA1887F),
  //    400: Color(0xFF8D6E63),
  //    500: Color(_greenPrimaryValue),
  //    600: Color(0xFF6D4C41),
  //    700: Color(0xFF5D4037),
  //    800: Color(0xFF4E342E),
  //    900: Color(0xFF3E2723),
  //  },
  //);
  //static const int _greenPrimaryValue = 0xFFA1C012;

  static material.MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return material.MaterialColor(color.value, swatch);
  }
}
*/
