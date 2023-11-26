// ignore_for_file: public_member_api_docs, avoid_print

enum _Color { black, red, green, yellow, blue, purple, cyan }

/// Sets bash color for terminal output.
/// see: https://misc.flogisoft.com/bash/tip_colors_and_formatting
class _To {
  const _To(
    this.color, {
    this.bold = true,
    //this.blink = false,
    //this.underline = false,
    //this.light = true,
  });
  final _Color color;
  final bool bold;
  //final bool blink;
  //final bool underline;
  //final bool light = true;

  String get _colorValue => switch (color) {
        _Color.black => '0',
        _Color.red => '1',
        _Color.green => '2',
        _Color.yellow => '3',
        _Color.blue => '4',
        _Color.purple => '5',
        _Color.cyan => '6',
      };

  String format(String string) {
    const esc = '\u001b[';
    var result = '';
    result += bold ? '${esc}1m' : '';
    //result += underline ? '${esc}4m' : '';
    //result += blink ? '${esc}5m' : '';
    //final forground = light ? '9' : '3'; // Light or normal.
    const forground = '9';
    result += '$esc$forground${_colorValue}m'; // All together.
    result += string;
    result += '${esc}0m'; // Reset all attributes.
    return result;
  }
}

extension BashColorString on String {
  //String get parenthesis => '($this)';
  String get red => const _To(_Color.red).format(this);
  String get redThin => const _To(_Color.red, bold: false).format(this);
  String get blue => const _To(_Color.blue).format(this);
  String get blueThin => const _To(_Color.blue, bold: false).format(this);
  String get black => const _To(_Color.black).format(this);
  String get blackThin => const _To(_Color.black, bold: false).format(this);
  String get green => const _To(_Color.green).format(this);
  String get greenThin => const _To(_Color.green, bold: false).format(this);
  String get yellow => const _To(_Color.yellow).format(this);
  String get yellowThin => const _To(_Color.yellow, bold: false).format(this);
  String get purple => const _To(_Color.purple).format(this);
  String get purpleThin => const _To(_Color.purple, bold: false).format(this);
  String get cyan => const _To(_Color.cyan).format(this);
  String get cyanThin => const _To(_Color.cyan, bold: false).format(this);
}

void main() {
  print('red'.red);
  print('redThin'.redThin);
  print('blue'.blue);
  print('blueThin'.blueThin);
  print('black'.black);
  print('blackThin'.blackThin);
  print('green'.green);
  print('greenThin'.greenThin);
  print('yellow'.yellow);
  print('yellowThin'.yellowThin);
  print('purple'.purple);
  print('purpleThin'.purpleThin);
  print('cyan'.cyan);
  print('cyanThin'.cyanThin);
}

/// Dæmi:  
//String blue0(String msg) => '\u001b[74m$msg\u001b[0m'; // Small
//String blue1(String msg) => '\u001b[1m\u001b[94m$msg\u001b[0m'; // Light bold
//String blue2(String msg) => '\u001b[34m$msg\u001b[0m'; // Forgrunnur
//String blue3(String msg) => '\u001b[44m$msg\u001b[0m'; // Bakgrunnur
//String blue4(String msg) => '\u001b[1m$msg\u001b[0m'; // Bold
//
//String red(String msg) => '\u000b[91m$msg\u001b[0m';
//String green(String msg) => '\u000b[92m$msg\u001b[0m';
//String yellow(String msg) => '\u000b[93m$msg\u001b[0m';
//String blue(String msg) => '\u000b[94m$msg\u001b[0m';
//String purple(String msg) => '\u000b[95m$msg\u001b[0m';
//String cyan(String msg) => '\u000b[96m$msg\u001b[0m';
