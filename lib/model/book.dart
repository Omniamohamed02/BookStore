import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final String title;
  final String authors;
  final String thumbnail;
  final int pageCount;
  final String publishedDate;
  final String description;
  final String category;

  Book({
    required this.title,
    required this.authors,
    required this.thumbnail,
    required this.pageCount,
    required this.publishedDate,
    required this.description,
    required this.category,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}
