/*import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  const Headers.head({this.child, this.children, Key? key})
      : height = 100,
        assert(child == null || children == null),
        super(key: key);
  final double height;
  final Widget? child;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    if (children != null) {
      return SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children!,
        ),
      );
    }
    return SizedBox(
      height: height,
      child: child,
    );
  }
}
*/
