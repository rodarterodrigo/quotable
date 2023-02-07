import 'package:quotable/app/modules/quota_list/domain/entities/page.dart';

import '../../domain/entities/results.dart';

class PageModel extends Page{
  const PageModel({
    required int count,
    required int totalCount,
    required int page,
    required int totalPages,
    required int lastItemIndex,
    required Results results,
  }):super(
    page: page,
    totalPages: totalPages,
    count: count,
    lastItemIndex: lastItemIndex,
    results: results,
    totalCount: totalCount,
  );
}