/*
import 'package:dlib/dlib.dart';
import 'package:flutter/material.dart';
import 'package:wlib/src/paddings.dart';
import 'package:wlib/src/styles.dart';

class _Styler {
  String tag;
  TextStyle style;
  Function padding;
  _Styler({required this.tag, required this.style, required this.padding});
}

class RichTexts {
  static List<_Styler> stylers = [
    _Styler(
      tag: 'TITLE:',
      style: TextStyles.title,
      padding: Paddings.title,
    ),
    _Styler(
      tag: 'P:',
      style: TextStyles.paragraph,
      padding: Paddings.paragraph,
    ),
  ];
  //String _tlml = """
  //TITLE: Tilboð til nemenda Snöru
  //P: Ársaðgangur fyrir *990 kr.* í stað 5.443 kr.
  //""";
  static List<Widget> fromTlml({required String tlml}) {
    List<String> lines = [];
    // Hreinsun:
    for (String line in tlml.split('\n')) {
      //print(line);
      if (line.trim() == "") {
        // Tóm lína
        continue;
      }
      if (line.trim().startsWith("#")) {
        // Komment
        continue;
      }
      if (line.startsWith(' ')) {
        //if (0 < lines.length) {
        // Lína byrjar á bili, þá bætist hún við síðasta tag.
        lines.last += ' ' + line.trim();
        continue;
        //}
      }
      for (_Styler styler in stylers) {
        if (line.startsWith(styler.tag)) {
          lines.add(line.trim());
          break;
        }
      }
    }
    //print(lines);

    // Bý til Richtext lista
    List<Widget> richTexts = [];
    for (String line in lines) {
      for (_Styler styler in stylers) {
        if (line.startsWith(styler.tag)) {
          String text = line.substring(styler.tag.length).trim();
          List<InnerNode> nodes = TlmlInner.nodesOf(data: text);
          bool isBold = false;
          bool isItalic = false;
          List<TextSpan> textSpans = [];
          for (InnerNode node in nodes) {
            if (node.type == InnerNodeType.syntax) {
              if (node.text == "*") {
                isItalic = !isItalic;
              }
              if (node.text == "**") {
                isBold = !isBold;
              }
            }
            if (node.type == InnerNodeType.text) {
              late TextStyle textStyle;
              if (isBold && isItalic) {
                textStyle = const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                );
              } else if (isBold) {
                textStyle = const TextStyle(
                  fontWeight: FontWeight.w600,
                );
              } else if (isItalic) {
                textStyle = const TextStyle(
                  fontStyle: FontStyle.italic,
                );
              } else {
                textStyle = const TextStyle();
              }
              textSpans.add(TextSpan(text: node.text, style: textStyle));
              //print("$style ${node.text}");
            }
          }
          richTexts.add(
            styler.padding(
              child: SelectableText.rich(
                TextSpan(
                  //text: text,
                  style: styler.style,
                  children: textSpans,
                ),
              ),
            ),
          );
          break;
        }
      }
    }
    return richTexts;
  }
}
*/