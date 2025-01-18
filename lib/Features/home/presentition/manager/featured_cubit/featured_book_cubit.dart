import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:bookly_app/Features/home/data/reop/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var response = await homeRepo.fetchFeaturedBooks();

    return response.fold((failure) {
      emit(FeaturedBookFailure(error: failure.error));
    }, (books) {
      emit(FeaturedBookSuccess(myData: books));
    });
  }
}
