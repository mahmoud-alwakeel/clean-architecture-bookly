// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:bookly/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>> {
  HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchNewestBooks();
  }
}
