import 'package:quotable/app/core/shared/infrastructure/exceptions/global_exceptions.dart';

class GenericException implements GlobalExceptions{
  final String message;

  const GenericException(this.message);
}