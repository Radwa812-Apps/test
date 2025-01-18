part of 'featured_book_cubit.dart';

class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<Book> myData;

  const FeaturedBookSuccess({required this.myData});
}

class FeaturedBookFailure extends FeaturedBookState {
  final String error;

  const FeaturedBookFailure({required this.error});
}
