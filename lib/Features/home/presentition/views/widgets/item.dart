import 'package:bookly_app/core/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../routers.dart';
import '../../../data/Models/book/book.dart';

class FeaturedListItemW extends StatelessWidget {
  const FeaturedListItemW({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetails, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 2.9 / 4.3,
            child: CachedNetworkImage(
              // هيكيش الصوره وبكدا تكون محفوظه مش كل شويه يجيبها ةتستهلك داتا
              fit: BoxFit.fill,
              imageUrl: book.volumeInfo.imageLinks.smallThumbnail,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 186, 182, 182),
                  highlightColor: Color.fromARGB(255, 221, 215, 215),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey[300], // Grey box as placeholder
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
