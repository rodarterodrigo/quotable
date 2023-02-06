import 'package:quotable/app/modules/quota_list/domain/failures/list_quota_failures.dart';

class PageNotExixtsFailure implements ListQuotaFailures{
  final String message;

  const PageNotExixtsFailure(this.message);
}