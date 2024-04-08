import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class CommonCommands {
    static void hiveSaveBooksData(List<BookEntity> booksList, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(booksList);
  }

}