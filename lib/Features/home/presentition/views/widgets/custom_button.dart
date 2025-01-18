import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.radius,
    required this.textColor,
    required this.onpress,
  }) : super(key: key);

  final BorderRadius radius;
  final String title;
  final Color color;
  final Color textColor;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: radius),
              backgroundColor: color),
          onPressed: onpress,
          child: Text(
            title,
            style: Style.text18
                .copyWith(color: textColor, fontWeight: FontWeight.w900),
          )),
    );
  }
}
