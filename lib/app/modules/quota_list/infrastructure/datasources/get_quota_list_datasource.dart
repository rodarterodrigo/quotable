import 'package:quotable/app/modules/quota_list/domain/parameters/page_number_parameter.dart';

import '../models/page_model.dart';

abstract class GetQuotaListDatasource{
  Future<PageModel> getQuotaListJson(PageNumberParameter parameter);
}