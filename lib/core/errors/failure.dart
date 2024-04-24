import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "sending Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "recieve Timeout");
      case DioExceptionType.badCertificate:
      return ServerFailure(message: "Connection Timeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResposne(e.response!.statusCode!, e.response!.data);      
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return ServerFailure(message: "No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(message: "Oops there was an error, please try again");
    }
  }

  factory ServerFailure.fromResposne(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(message: "Request not found, please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(message: "There is a problem with the server");
    } else {
      return ServerFailure(message: "Something went wrong, please try again later");
    }
  }
}
