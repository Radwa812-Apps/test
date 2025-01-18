import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsBar extends StatelessWidget {
  const BookDetailsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: (() {
            GoRouter.of(context).pop();
          }),
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        const Icon(
          Icons.shopping_cart,
        ),
      ],
    );
  }
}
