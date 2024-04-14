import 'package:fpdart/fpdart.dart';
import 'package:my_blog/core/error/failures.dart';
import 'package:my_blog/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/entities/user.dart';
import '../../../../core/usecase/usecase.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
