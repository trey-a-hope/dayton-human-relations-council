import 'package:flutter/material.dart';

class CustomGeneralTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CustomGeneralTextWidget({
    Key? key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Text(
        text,
        style: style,
        // style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
