import 'package:chat/features/login/data/datasources/firebase_auth_login_remote_data_source.dart';
import 'package:chat/features/login/data/repositories/login_user_repository_impl.dart';
import 'package:chat/features/login/domain/repositories/login_user_repository.dart';
import 'package:chat/features/login/domain/usecases/login_user_usecase.dart';
import 'package:chat/features/login/presentaion/cubit/login_cubit.dart';
import 'package:chat/features/register/data/datasources/firebase_auth_register_remote_data_source.dart';
import 'package:get_it/get_it.dart';

import 'features/register/data/repositories/register_user_repository_impl.dart';
import 'features/register/domain/repositories/reqister_user_repository.dart';
import 'features/register/domain/usecases/register_user.dart';
import 'features/register/presentation/cubit/register_cubit.dart';

final serviceLocator = GetIt.instance;
void init() {
  //! Blocs
  serviceLocator.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerUserUseCase: serviceLocator()));
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(loginUserUseCase: serviceLocator()));
//! Feature
  // serviceLocator.registerFactory(
  // () => RegisterCubit(registerUserUseCase: serviceLocator()));

//! UseCases
  serviceLocator.registerLazySingleton<RegisterUserUseCase>(
      () => RegisterUserUseCase(registerUserRepository: serviceLocator()));
  serviceLocator.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(loginUserRepository: serviceLocator()));
//! Repository
  serviceLocator.registerLazySingleton<RegisterUserRepository>(() =>
      RegisterUserRepositoryImpl(
          registerUserRemoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<LoginUserRepository>(
      () => LoginUserRepositoryImpl(loginRemoteDataSource: serviceLocator()));
  //! Datasources
  serviceLocator
      .registerLazySingleton<FirebaseAuthenticationRegisterRemoteDataSource>(
          () => FirebaseAuthenticationRegisterRemoteDataSource());
  serviceLocator
      .registerLazySingleton<FirebaseAuthenticationLoginRemoteDataSource>(
          () => FirebaseAuthenticationLoginRemoteDataSource());
//! Core

//! External
}
