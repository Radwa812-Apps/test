import 'package:bookly_app/Features/home/data/services/api_services.dart';
import 'package:bookly_app/Features/home/data/services/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentition/manager/search_cubit/search_book_cubit.dart';
import 'package:bookly_app/Features/home/presentition/views/home.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/best_seller_listView.dart';
import 'package:bookly_app/Features/home/presentition/views/widgets/shimmer_best_item.dart';
import 'package:bookly_app/core/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../Style.dart';
import '../../../../routers.dart';
import '../../../home/presentition/views/widgets/best_seller_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter Title',
                suffixIcon: IconButton(
                  onPressed: (() {
                    BlocProvider.of<SearchBookCubit>(context)
                        .getNewestBooks(title: title!);
                  }),
                  icon: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            BlocBuilder<SearchBookCubit, SearchBookState>(
                builder: (context, state) {
              if (state is SearchBookSuccess) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.book.length,
                      itemBuilder: ((context, index) {
                        return BestSellerItem(book: state.book[index]);
                      })),
                );
              } else if (state is SearchBookFailure) {
                return Center(
                    child: Text(
                  state.error,
                  style: Style.text20,
                ));
              } else if (state is SearchBookLoading) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: ((context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ShimmerBestItem(),
                      );
                    }),
                  ),
                );
              } else {
                return Text('');
              }
            })

            //   Expanded(
            //     child: ListView.builder(
            //       padding: EdgeInsets.zero,
            //       // itemCount: 10,
            //       itemBuilder: ((context, index) {
            //        //   return const BestSellerItem();
            //         return const Text('ds');
            //       }
            //       ),
            //     ),
            //   )
            // ],
          ]),
        ),
      ),
    );
  }
}
