part of 'search_book_cubit.dart';

class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

class SearchBookInitial extends SearchBookState {}

class SearchBookSuccess extends SearchBookState {
  final List<Book> book;

  const SearchBookSuccess(this.book);
}

class SearchBookLoading extends SearchBookState {}

class SearchBookFailure extends SearchBookState {
  final String error;

  const SearchBookFailure(this.error);
}
