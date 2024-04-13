import 'package:get_it/get_it.dart';
import 'package:my_blog/core/secrets/app_secrets.dart';
import 'package:my_blog/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:my_blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_blog/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_blog/features/auth/domain/usecases/user_signup.dart';
import 'package:my_blog/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/domain/usecases/user_signin.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  // ** supabase initialization **
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseURL,
    anonKey: AppSecrets.supabseKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(serviceLocator()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))
    ..registerFactory(() => UserSignUp(serviceLocator()))
    ..registerFactory(() => UserSignIn(serviceLocator()))
    ..registerLazySingleton(() => AuthBloc(
          userSignUp: serviceLocator(),
          userSignIn: serviceLocator(),
        ));
}
