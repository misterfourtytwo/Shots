import 'package:flutter/material.dart';

import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

/// Sliding panel section, or any other section
class Section extends StatelessWidget {
  Section({@required this.title, this.children = const []});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: Values.mainPadding),
        Text(title, style: TextStyles.sectionHeader),
        SizedBox(height: Values.mainPadding * .67),
        ...children,
      ],
    );
  }
}
