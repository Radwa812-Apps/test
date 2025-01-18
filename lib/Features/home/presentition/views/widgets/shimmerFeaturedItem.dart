import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../routers.dart';

class ShimmerFeaturedItem extends StatelessWidget {
  const ShimmerFeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetails);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 2.9 / 4.3,
            child: Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 148, 143, 143),
      highlightColor: Color.fromARGB(255, 221, 215, 215),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[300], // Grey box as placeholder
              ),
            ),
          ),
        ),
      ),
    );
  }
}
