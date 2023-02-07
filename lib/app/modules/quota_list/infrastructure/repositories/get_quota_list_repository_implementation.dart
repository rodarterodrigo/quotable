import 'package:dartz/dartz.dart';
import 'package:quotable/app/core/shared/domain/failures/generic_failure.dart';
import 'package:quotable/app/core/shared/domain/failures/global_failures.dart';
import 'package:quotable/app/core/shared/infrastructure/exceptions/generic_exception.dart';
import 'package:quotable/app/modules/quota_list/domain/entities/page.dart';
import 'package:quotable/app/modules/quota_list/domain/failures/page_not_exixts_failure.dart';
import 'package:quotable/app/modules/quota_list/domain/parameters/page_number_parameter.dart';
import 'package:quotable/app/modules/quota_list/domain/repositories/get_quota_list_repository.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/datasources/get_quota_list_datasource.dart';

import '../exceptions/page_not_exists_exception.dart';

class GetQuotaListRepositoryImplementation implements GetQuotaListRepository{
  final GetQuotaListDatasource datasource;

  const GetQuotaListRepositoryImplementation(this.datasource);

  @override
  Future<Either<GlobalFailures, Page>> getQuotaList(PageNumberParameter parameter) async {
    try{
      return Right(await datasource.getQuotaListJson(parameter));
    } on PageNotExistsException catch(error){
      return Left(PageNotExixtsFailure(error.message));
    } on GenericException catch(error){
      return Left(GenericFailure(error.message));
    } on Exception catch(error){
      return Left(GenericFailure(error.toString()));
    }
  }
}