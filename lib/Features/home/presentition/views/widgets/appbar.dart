import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarW extends StatelessWidget {
  const AppBarW({
    Key? key, required this.OnPress,
  }) : super(key: key);

  final Function() OnPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 20,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: OnPress,
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
            )
          ],
        ));
  }
}
