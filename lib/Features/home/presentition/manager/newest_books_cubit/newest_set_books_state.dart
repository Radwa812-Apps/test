part of 'newest_set_books_cubit.dart';

class NewestSetBooksState extends Equatable {
  const NewestSetBooksState();

  @override
  List<Object> get props => [];
}

class NewestSetBooksInitial extends NewestSetBooksState {}

class NewestSetBooksFailure extends NewestSetBooksState {
  final String error;

  const NewestSetBooksFailure({required this.error});
}

class NewestSetBooksSuccess extends NewestSetBooksState {
 final List<Book> data;

  const NewestSetBooksSuccess({required this.data});

}

class NewestSetBooksLoading extends NewestSetBooksState {}
