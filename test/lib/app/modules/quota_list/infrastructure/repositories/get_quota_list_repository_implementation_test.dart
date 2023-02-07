import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quotable/app/core/shared/domain/failures/generic_failure.dart';
import 'package:quotable/app/core/shared/infrastructure/exceptions/generic_exception.dart';
import 'package:quotable/app/modules/quota_list/domain/entities/page.dart';
import 'package:quotable/app/modules/quota_list/domain/failures/page_not_exixts_failure.dart';
import 'package:quotable/app/modules/quota_list/domain/parameters/page_number_parameter.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/datasources/get_quota_list_datasource.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/exceptions/page_not_exists_exception.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/models/page_model.dart';
import 'package:quotable/app/modules/quota_list/infrastructure/repositories/get_quota_list_repository_implementation.dart';

class GetQuotaListDatasourceMock extends Mock implements GetQuotaListDatasource{}
class PageNumberParameterFake extends Fake implements PageNumberParameter{}
class PageModelFake extends Fake implements PageModel{}

final GetQuotaListDatasource datasource = GetQuotaListDatasourceMock();
final GetQuotaListRepositoryImplementation repository = GetQuotaListRepositoryImplementation(datasource);

void main(){
  setUpAll((){
    registerFallbackValue(PageNumberParameterFake());
  });

  test('Should receive an PageModel and deliver to domain a Page entity', () async{
    when(() => datasource.getQuotaListJson(any())).thenAnswer((invocation) async => PageModelFake());
    final result = await repository.getQuotaList(PageNumberParameterFake());
    expect(result.fold(id, id), isA<Page>());
  });

  test('Should receive an PageNotExistsException and deliver to domain a PageNotExixtsFailure', () async{
    when(() => datasource.getQuotaListJson(any())).thenThrow(const PageNotExistsException('PageNotExistsException'));
    final result = await repository.getQuotaList(PageNumberParameterFake());
    expect(result.fold(id, id), isA<PageNotExixtsFailure>());
  });

  test('Should receive an GenericException and deliver to domain a GenericFailure', () async{
    when(() => datasource.getQuotaListJson(any())).thenThrow(const GenericException('GenericException'));
    final result = await repository.getQuotaList(PageNumberParameterFake());
    expect(result.fold(id, id), isA<GenericFailure>());
  });

  test('Should receive an Exception and deliver to domain a GenericFailure', () async{
    when(() => datasource.getQuotaListJson(any())).thenThrow(Exception('Exception'));
    final result = await repository.getQuotaList(PageNumberParameterFake());
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}