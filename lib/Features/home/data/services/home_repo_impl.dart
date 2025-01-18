import 'package:bookly_app/Features/home/data/services/api_services.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly_app/core/failer.dart';

import 'package:bookly_app/Features/home/data/Models/book/book.dart';
import 'package:dio/dio.dart';

import '../reop/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failer, List<Book>>> fetchNewestSetBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest');

      List<Book> books = [];
      for (var element in data['items']) {
        books.add(Book.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioEror(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failer, List<Book>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=programming');

      List<Book> books = [];
      for (var element in data['items']) {
        books.add(Book.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioEror(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failer, List<Book>>> fetchSimilarBooks(
      {required String catigory}) async {
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&q=$catigory&Sorting=relevant');

      List<Book> books = [];
      for (var element in data['items']) {
        books.add(Book.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioEror(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failer, List<Book>>> fetchSearchBooks(
      {required String title}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$title');

      List<Book> books = [];
      for (var element in data['items']) {
        books.add(Book.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioEror(e));
      } else {
        return left(ServerFailer(e.toString()));
      }
    }
  }
}
