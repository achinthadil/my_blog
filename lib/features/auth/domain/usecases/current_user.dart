import 'package:fpdart/fpdart.dart';
import 'package:my_blog/core/error/failures.dart';
import 'package:my_blog/core/usecase/usecase.dart';
import 'package:my_blog/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/entities/user.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
