import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Style.dart';
import 'item_image.dart';
import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:bookly_app/routers.dart';

class ShimmerBestSellerItem extends StatelessWidget {
  const ShimmerBestSellerItem({
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
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.purple,
        child: Row(
          children: [
            ItemImage(
              image: book.volumeInfo.imageLinks.smallThumbnail,
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          book.volumeInfo.title!,
                          style: Style.text20,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        (book.volumeInfo.authors != null &&
                                book.volumeInfo.authors!.isNotEmpty)
                            ? book.volumeInfo.authors![0]
                            : 'Unknown Author',
                        style: Style.text14,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Free',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '4.8',
                            style: Style.text18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${book.volumeInfo.pageCount ?? '0'}',
                            style:
                                Style.text18.copyWith(color: Colors.blueGrey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
