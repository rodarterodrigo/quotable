import 'package:quotable/app/modules/quota_list/domain/entities/tags.dart';

import '../../domain/entities/quota.dart';

class QuotaModel extends Quota{
  const QuotaModel({
    required String id,
    required String author,
    required String content,
    required Tags tags,
    required String authorSlug,
    required int length,
    required String dateAdded,
    required String dateModified,
}):super(
    id: id,
    content: content,
    author: author,
    authorSlug: authorSlug,
    dateAdded: dateAdded,
    dateModified: dateModified,
    length: length,
    tags: tags,
  );

  factory QuotaModel.fromJson(Map<String, dynamic> json) =>
      QuotaModel(
        tags: json['tags'],
        length: json['length'],
        dateModified: json['dateModified'],
        dateAdded: json['dateAdded'],
        authorSlug: json['authorSlug'],
        author: json['author'],
        content: json['content'],
        id: json['_id'],
      );
}