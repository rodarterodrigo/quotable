import 'package:quotable/app/modules/quota_list/infrastructure/exceptions/get_quota_list_exceptions.dart';

class PageNotExistsException implements GetQuotaListExceptions{
  final String message;

  const PageNotExistsException(this.message);
}