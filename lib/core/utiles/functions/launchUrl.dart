import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_snakBar.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url !=null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customSnakBar(context, url);
  }
}
}

