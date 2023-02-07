import 'package:quotable/app/modules/quota_list/domain/entities/tags.dart';

class Quota{
  final String id;
  final String author;
  final String content;
  final Tags tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  const Quota(
      {required this.id,
      required this.author,
      required this.content,
      required this.tags,
      required this.authorSlug,
      required this.length,
      required this.dateAdded,
      required this.dateModified});
}