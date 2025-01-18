import 'package:bookly_app/Features/home/presentition/manager/newest_books_cubit/newest_set_books_cubit.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/best_seller_item.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/shimmer_best_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Style.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestSetBooksCubit, NewestSetBooksState>(
        builder: (context, state) {
      if (state is NewestSetBooksSuccess) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.data.length,
          itemBuilder: ((context, index) {
            return BestSellerItem(
              book: state.data[index],
            );
          }),
        );
      } else if (state is NewestSetBooksFailure) {
        return Center(
            child: Text(
          state.error,
          style: Style.text20,
        ));
      } else {
        // Show shimmer placeholders while loading
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 5, // Show 5 shimmer items as placeholders
          itemBuilder: ((context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: ShimmerBestItem(),
            ); // Use the shimmer item widget
          }),
        );
      }
    });
  }
}


  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       ((context, index) 
  //         return BlocBuilder<NewestSetBooksCubit, NewestSetBooksState>(
  //             builder: (context, state) {

  //           if (state is NewestSetBooksSuccess) {
  //             return BestSellerItem(book: state.data[index]);
  //           } else if (state is NewestSetBooksFailure) {
  //             return Center(
  //                 child: Text(
  //               state.error,
  //               style: Style.text20,
  //             ));
  //           } else {
  //             return const Center(child: CircularProgressIndicator());
  //           }
  //         });
  //       }),
  //    childCount: 10 ),
  //   );
  // }

