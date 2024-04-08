// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> booksList = getBooksList(data);
    return booksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&sorting=newest&q=programming");
    List<BookEntity> booksList = getBooksList(data);
    return booksList;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> booksList = [];
    for (var bookMap in data['items']) {
      booksList.add(BookModel.fromJson(bookMap));
    }
    return booksList;
  }
}
