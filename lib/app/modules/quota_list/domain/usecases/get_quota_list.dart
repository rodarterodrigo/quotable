import 'package:dartz/dartz.dart';
import 'package:quotable/app/modules/quota_list/domain/repositories/get_quota_list_repository.dart';
import '../../../../core/shared/domain/failures/global_failures.dart';
import '../entities/page.dart';
import '../parameters/page_number_parameter.dart';

abstract class GetQuotaListAbstraction{
  Future<Either<GlobalFailures, Page>> call(PageNumberParameter parameter);
}

class GetQuotaList implements GetQuotaListAbstraction{
  final GetQuotaListRepository repository;

  const GetQuotaList(this.repository);

  @override
  Future<Either<GlobalFailures, Page>> call(PageNumberParameter parameter) async =>
      repository.getQuotaList(parameter);
}