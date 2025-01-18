import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failer.dart';

abstract class HomeRepo {
  Future<Either<Failer, List<Book>>> fetchNewestSetBooks();

  Future<Either<Failer, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failer, List<Book>>> fetchSimilarBooks({required String catigory});
  Future<Either<Failer, List<Book>>> fetchSearchBooks({required String title});

}
