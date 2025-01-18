import 'package:bookly_app/Features/home/presentition/manager/featured_cubit/featured_book_cubit.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/item.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/shimmerFeaturedItem.dart'; // Import the shimmer item
import 'package:bookly_app/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewW extends StatelessWidget {
  const FeaturedListViewW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .26,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.myData.length,
                itemBuilder: ((context, index) {
                  return FeaturedListItemW(book: state.myData[index]);
                }),
              ),
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return Center(
              child: Text(
            state.error,
            style: Style.text20,
          ));
        } else {
          // Display shimmer placeholders while loading
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .26,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,  // You can adjust the number of shimmer items
                itemBuilder: ((context, index) {
                  return const ShimmerFeaturedItem(); // Use the shimmer item
                }),
              ),
            ),
          );
        }
      },
    );
  }
}
