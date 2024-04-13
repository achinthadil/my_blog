import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

abstract interface class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
