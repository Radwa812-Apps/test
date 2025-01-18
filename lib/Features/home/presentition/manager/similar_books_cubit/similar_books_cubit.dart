import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:bookly_app/Features/home/data/reop/home_repo.dart';
import 'package:bookly_app/Features/home/presentition/views/home.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo})
      : super(SimilarBooksInitial());

  final HomeRepo homeRepo;


  Future<void> getSimilarBooks({required String catigory}) async {
    emit(
      SimilarBooksLaoding(),
    );

    var data = await homeRepo.fetchSimilarBooks(
        catigory: catigory);

    return data.fold(
      (failure) {
        emit(
          SimilarBooksFailure(failure.error),
        );
      },
      (books) {
        emit(
          SimilarBooksSuccess(books),
        );
      },
    );
  }
}
