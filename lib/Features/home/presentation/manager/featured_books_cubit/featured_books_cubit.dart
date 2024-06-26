import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNum);
    result.fold((l) {
      if (pageNum == 0) {
        emit(FeaturedBooksFailure(errorMessage: l.message));
      } else {
        emit(FeaturedBooksPaginationFailure(errorMessage: l.message));
      }
      
      },
        (r) => emit(FeaturedBooksSuccess(books: r)));
  }
}
