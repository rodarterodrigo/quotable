import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quotable/app/core/shared/domain/failures/generic_failure.dart';
import 'package:quotable/app/modules/quota_list/domain/entities/page.dart';
import 'package:quotable/app/modules/quota_list/domain/failures/page_not_exixts_failure.dart';
import 'package:quotable/app/modules/quota_list/domain/parameters/page_number_parameter.dart';
import 'package:quotable/app/modules/quota_list/domain/repositories/get_quota_list_repository.dart';
import 'package:quotable/app/modules/quota_list/domain/usecases/get_quota_list.dart';

class GetQuotaListRepositoryMock extends Mock implements GetQuotaListRepository{}
class PageFake extends Fake implements Page{}
class PageNumberParameterFake extends Fake implements PageNumberParameter{}

final GetQuotaListRepository repository = GetQuotaListRepositoryMock();
final GetQuotaList usecase = GetQuotaList(repository);

void main(){
  setUpAll((){
    registerFallbackValue(PageNumberParameterFake());
  });

  test('Get all quota list as Page entity', () async{
    when(() => repository.getQuotaList(any())).thenAnswer((invocation) async => Right(PageFake()));
    final result = await usecase(PageNumberParameterFake());
    expect(result.fold(id, id), isA<Page>());
  });

  test('Should receive a GenericFailure', () async{
    when(() => repository.getQuotaList(any())).thenAnswer((invocation) async => const Left(GenericFailure('GenericFailure')));
    final result = await usecase(PageNumberParameterFake());
    expect(result.fold(id, id), isA<GenericFailure>());
  });

  test('Should receive a PageNotExixtsFailure', () async{
    when(() => repository.getQuotaList(any())).thenAnswer((invocation) async => const Left(PageNotExixtsFailure('PageNotExixtsFailure')));
    final result = await usecase(PageNumberParameterFake());
    expect(result.fold(id, id), isA<PageNotExixtsFailure>());
  });
}