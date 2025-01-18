part of 'similar_books_cubit.dart';

class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<Book> similarBooks;

  const SimilarBooksSuccess(this.similarBooks);

}

class SimilarBooksLaoding extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String error;

  const SimilarBooksFailure(this.error);
}
