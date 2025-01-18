import 'package:bookly_app/Features/home/data/services/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentition/manager/featured_cubit/featured_book_cubit.dart';
import 'package:bookly_app/Features/home/presentition/manager/newest_books_cubit/newest_set_books_cubit.dart';
import 'package:bookly_app/Features/home/presentition/manager/search_cubit/search_book_cubit.dart';
import 'package:bookly_app/core/services_locator.dart';
import 'package:bookly_app/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

void main() {
  debugPaintSizeEnabled = false;
  setup();

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(getIt.get<HomeRepoImpl>())..getFeaturedBooks(),
          // .. دى معاناها انه نفذ الجزء دا
          // . دى معناها هعمل ريتيرن للحاجه اللي راجعه من المثود دى
        ),
        BlocProvider(
          create: (context) =>
              NewestSetBooksCubit(getIt.get<HomeRepoImpl>())..getNewestBooks(),
        ),
        BlocProvider(
            create: (context) => SearchBookCubit(getIt.get<HomeRepoImpl>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(
                  ThemeData.dark().textTheme,
                ),
                brightness: Brightness.dark)
            .copyWith(scaffoldBackgroundColor: Kcolor),
      ),
    );
  }
}
