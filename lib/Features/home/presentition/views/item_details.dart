import 'package:bookly_app/Features/home/presentition/views/widgets/best_seller_listView.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/book_bar.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/custom_button.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/featured_listview.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/item.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/similarBooksList.dart';
import 'package:bookly_app/Style.dart';
import 'package:bookly_app/core/utiles/functions/launchUrl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/Models/book/book.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final Book book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            const BookDetailsBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.25),
              child: FeaturedListItemW(book: book),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              book.volumeInfo.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Style.text25,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4,
            ),
            Opacity(
              opacity: 0.7,
              child: Text(
                (book.volumeInfo.authors != null &&
                        book.volumeInfo.authors!.isNotEmpty)
                    ? book.volumeInfo.authors![0]
                    : 'Unknown Author',
                style: Style.text14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  '[254]',
                  style: Style.text18.copyWith(color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    onpress: (() {}),
                    color: Colors.white,
                    radius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    title: 'Free',
                    textColor: Colors.black,
                  )),
                  Expanded(
                      child: CustomButton(
                    onpress: (() {
                      launchCustomUrl(context, book.volumeInfo.previewLink);
                    }),
                    color: const Color.fromARGB(255, 237, 130, 73),
                    radius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    title: textName(book),
                    textColor: Colors.white,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Style.text14.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                child: FeaturedListViewW()),
          ]),
        ),
      ),
    );
  }

  textName(Book book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
