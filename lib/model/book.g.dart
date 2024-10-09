// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      title: json['volumeInfo']['title'] as String? ?? 'Unknown Title',
      authors: (json['volumeInfo']['authors'] as List<dynamic>?)
          ?.join(', ') ??
          'Unknown Authors',
      thumbnail: json['volumeInfo']['imageLinks']?['thumbnail'] ?? 'default_image_url',
      pageCount: json['volumeInfo']['pageCount'] as int? ?? 0,
      publishedDate: json['volumeInfo']['publishedDate'] as String? ?? 'Unknown Date',
      description: json['volumeInfo']['description'] as String? ?? 'No Description',
      category: (json['volumeInfo']['categories'] as List<dynamic>?)
          ?.isNotEmpty == true
          ? json['volumeInfo']['categories'][0]
          : 'Unknown Category',
);
Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'thumbnail': instance.thumbnail,
      'pageCount': instance.pageCount,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'category': instance.category,
    };
