import 'package:bookly_app/Features/home/presentition/views/widgets/best_seller_listView.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/featured_listview.dart';
import 'package:bookly_app/routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Style.dart';
import 'widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(child: AppBarW(
                        OnPress: () {
                          GoRouter.of(context).push(AppRouters.search);
                        },
                      )),
                      const FeaturedListViewW(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'Best Seller',
                          style: Style.text18,
                        ),
                      ),
                    ],
                  ),
                ),
                //const BestSellerList(),
                const SliverToBoxAdapter(
                  child: BestSellerList(),
                )
                // BlocBuilder<NewestSetBooksCubit, NewestSetBooksState>(
                //   builder: (context, state) {
                //     if (state is NewestSetBooksSuccess) {
                //       return SliverList(
                //         delegate: SliverChildBuilderDelegate(
                //           ((context, index) {
                //             return BestSellerItem(book: state.data[index]);
                //           }),
                //           childCount: state.data.length,
                //         ),
                //       );
                //     } else if (state is NewestSetBooksFailure) {
                //       return Center(
                //           child: Text(
                //         state.error,
                //         style: Style.text20,
                //       ));
                //     } else {
                //       return const Center(child: CircularProgressIndicator());
                //     }
                //   },
                // )
              ])),
    );
  }
}
