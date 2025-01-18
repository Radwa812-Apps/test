import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/reop/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/Models/book/book.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());

  final HomeRepo homeRepo;

  Future<void> getNewestBooks({required String title}) async {
    emit(
      SearchBookLoading(),
    );

    var data = await homeRepo.fetchSearchBooks(title:title );

    return data.fold(
      (failure) {
        emit(
          SearchBookFailure(
            failure.error,
          ),
        );
      },
      (books) {
        emit(
          SearchBookSuccess(
             books,
          ),
        );
      },
    );
  }
}
