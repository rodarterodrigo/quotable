import 'package:quotable/app/core/shared/domain/failures/global_failures.dart';

class GenericFailure implements GlobalFailures{
  final String message;

  const GenericFailure(this.message);
}