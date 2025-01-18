import 'package:bookly_app/Features/home/data/services/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentition/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentition/views/home.dart';
import 'package:bookly_app/Features/home/presentition/views/item_details.dart';
import 'package:bookly_app/Features/search/presentation/views/result_of_search.dart';
import 'package:bookly_app/Features/search/presentation/views/search.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Features/home/data/Models/book/book.dart';

abstract class AppRouters {
  // عشان معرفش انشي منه نسخه مش محتاجه اعمل منه اوبجيكت
// كمان كل المتغيرات استيتك عشان مش هعرف اعمل اوبجيكت ف ااكسس عن طريق الكلاس نفسه
  static const home = '/HomeView';
  static const bookDetails = '/BookDetails';
  static const search = '/search';
  static const searchedBooks = '/reasultOfSearch';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // دا اول مكان هيروح ليه بيعرفه  عند طريق الاسلاش دى
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(homeRepo: getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            book: state.extra as Book,
          ),
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: searchedBooks,
        builder: (context, state) => const ResultOfSearch(),
      ),
    ],
  );
}
