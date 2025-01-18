import 'package:flutter/material.dart';

void customSnakBar(context, String url) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Cannot Launch this $url',
      ),
    ),
  );
}
