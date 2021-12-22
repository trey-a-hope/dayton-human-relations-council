import 'package:dayton_human_relations_council/constants.dart';
import 'package:flutter/material.dart';

class AppVersionText extends StatelessWidget {
  AppVersionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text('\n\nApp Version: $version ($buildNumber)'),
    );
  }
}
