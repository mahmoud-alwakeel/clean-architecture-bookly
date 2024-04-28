import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class CommonCommands {
  void hiveSaveBooksData(List<BookEntity> booksList, String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    box.addAll(booksList);
  }
}