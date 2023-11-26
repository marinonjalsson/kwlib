/*
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart' hide Colors, Padding;
import 'package:kwlib/kwlib.dart';
//import 'package:wlib/src/colors.dart';
import 'package:wlib/src/styles.dart'; //tlml.dart';
import 'package:wlib/src/paddings.dart'; //tlml.dart';

enum _ButtonType { strong, weak }

class Buttons extends StatelessWidget {
  const Buttons.strong({
    required this.text,
    required this.onPressed,
    super.key,
  })  : type = _ButtonType.strong;
  const Buttons.weak({
    required this.text,
    required this.onPressed,
    super.key,
  })  : type = _ButtonType.weak;
  final String text;
  final VoidCallback onPressed;
  final _ButtonType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _ButtonType.strong:
        return Paddings.buttton(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyles.strong,
            child: Text(text, style: TextStyles.strongButton),
          ),
        );
      case _ButtonType.weak:
        return Paddings.buttton(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyles.weak,
            child: Text(text, style: TextStyles.weakButton),
          ),
        );
    }
  }
}
*/
