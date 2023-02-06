import 'package:dartz/dartz.dart';
import '../../../../core/shared/domain/failures/global_failures.dart';
import '../entities/page.dart';
import '../parameters/page_number_parameter.dart';

abstract class GetQuotaListRepository{
  Future<Either<GlobalFailures, Page>> getQuotaList(PageNumberParameter parameter);
}