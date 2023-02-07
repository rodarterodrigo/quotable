import 'package:quotable/app/modules/quota_list/domain/entities/results.dart';

class Page{
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final Results results;

  const Page(
      {required this.count,
      required this.totalCount,
      required this.page,
      required this.totalPages,
      required this.lastItemIndex,
      required this.results});
}