import 'package:flutter/material.dart';

///
class Gap extends StatelessWidget {
  ///
  const Gap({required this.gap, super.key});

  ///
  const Gap.big()
      : gap = 60,
        super(key: null);

  ///
  const Gap.medium()
      : gap = 40,
        super(key: null);

  ///
  const Gap.small()
      : gap = 20,
        super(key: null);

  ///
  const Gap.foot()
      : gap = 50,
        super(key: null);

  ///
  final double gap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap,
      width: gap,
    );
  }
}
