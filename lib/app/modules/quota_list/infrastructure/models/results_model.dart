import 'package:quotable/app/modules/quota_list/domain/entities/results.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/models/quota_model.dart';

import '../../domain/entities/quota.dart';

class ResultsModel extends Results{
  const ResultsModel({
      required List<Quota> quotas,
  }):super(
    quotas: quotas,
  );

  factory ResultsModel.fromJson(List<dynamic> json) =>
      ResultsModel(quotas: json.map((e) => QuotaModel.fromJson(e)).toList());
}