import 'package:bookly_app/Features/home/presentition/views/widgets/best_seller_listView.dart';
import 'package:flutter/material.dart';

class ResultOfSearch extends StatelessWidget {
  const ResultOfSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          BestSellerList(),
        ],
      ),
    ));
  }
}
