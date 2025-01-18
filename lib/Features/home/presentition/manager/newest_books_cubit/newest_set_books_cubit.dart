import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:bookly_app/Features/home/data/reop/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_set_books_state.dart';

class NewestSetBooksCubit extends Cubit<NewestSetBooksState> {
  NewestSetBooksCubit(this.homeRepo) : super(NewestSetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(
      NewestSetBooksLoading(),
    );

    var data = await homeRepo.fetchNewestSetBooks();

    return data.fold(
      (failure) {
        emit(
          NewestSetBooksFailure(
            error: failure.error,
          ),
        );
      },
      (books) {
        emit(
          NewestSetBooksSuccess(
            data: books,
          ),
        );
      },
    );
  }

}
