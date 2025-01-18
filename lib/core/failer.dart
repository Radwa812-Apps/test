import 'package:dio/dio.dart';


abstract class Failer {
  final String error;

  Failer(this.error);
}

class ServerFailer extends Failer {
  ServerFailer(super.error);

  factory ServerFailer.fromDioEror(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer('Connection Timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailer('Send Timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailer('receive Timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailer('Bad Certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailer.fromResponse(
            dioError.response!.statusCode!, dioError.response);
      case DioExceptionType.cancel:
        return ServerFailer('Request to server canceled');

      case DioExceptionType.connectionError:
        return ServerFailer('No internet conection ');

      case DioExceptionType.unknown:
        return ServerFailer('Oops there was an error , please try again ');
    }
  }

  factory ServerFailer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailer('Your request not found , please try later ');
    } else if (statusCode == 500) {
      return ServerFailer('Internet server error, please try later ');
    } else {
      return ServerFailer('Oops there was an error , please try again ');
    }
  }
}
