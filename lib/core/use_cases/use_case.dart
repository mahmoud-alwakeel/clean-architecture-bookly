import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, int> {
  Future<Either<Failure, T>> call(int param);
}
