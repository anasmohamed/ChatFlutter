import 'package:chat/features/login/data/datasources/firebase_auth_login_remote_data_source.dart';
import 'package:chat/features/login/data/datasources/firestore_user.dart';
import 'package:chat/features/login/data/repositories/login_user_repository_impl.dart';
import 'package:chat/features/login/domain/repositories/login_user_repository.dart';
import 'package:chat/features/login/domain/usecases/login_user_usecase.dart';
import 'package:chat/features/login/presentaion/cubit/login_cubit.dart';
import 'package:chat/features/register/data/datasources/firebase_auth_register_remote_data_source.dart';
import 'package:chat/features/register/domain/repositories/firestore_user_repository.dart';
import 'package:chat/features/register/domain/usecases/add_new_user_to_firestore_usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/register/data/repositories/firestore_user_repo_impl.dart';
import 'features/register/data/repositories/register_user_repository_impl.dart';
import 'features/register/domain/repositories/reqister_user_repository.dart';
import 'features/register/domain/usecases/register_user.dart';
import 'features/register/presentation/cubit/add_new_user_to_firestore/add_new_user_to_firestore_cubit.dart';
import 'features/register/presentation/cubit/register_cubit.dart';

final serviceLocator = GetIt.instance;
void init() {
  //! Blocs
  serviceLocator.registerFactory<RegisterCubit>(
      () => RegisterCubit(registerUserUseCase: serviceLocator()));
  serviceLocator.registerFactory<LoginCubit>(
      () => LoginCubit(loginUserUseCase: serviceLocator()));

  serviceLocator.registerFactory<AddUserToFirestoreCubit>(() =>
      AddUserToFirestoreCubit(addNewUserToFirestoreUseCase: serviceLocator()));
//! Feature
  // serviceLocator.registerFactory(
  // () => RegisterCubit(registerUserUseCase: serviceLocator()));

//! UseCases
  serviceLocator.registerLazySingleton<RegisterUserUseCase>(
      () => RegisterUserUseCase(registerUserRepository: serviceLocator()));
  serviceLocator.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(loginUserRepository: serviceLocator()));
  serviceLocator.registerLazySingleton<AddNewUserToFirestoreUseCase>(() =>
      AddNewUserToFirestoreUseCase(addNewUserRepository: serviceLocator()));
//! Repository
  serviceLocator.registerLazySingleton<RegisterUserRepository>(() =>
      RegisterUserRepositoryImpl(
          registerUserRemoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<LoginUserRepository>(
      () => LoginUserRepositoryImpl(loginRemoteDataSource: serviceLocator()));

  serviceLocator.registerLazySingleton<FirestoreUserRepository>(
      () => FirestoreUserRepositoryImpl(firestoreUser: serviceLocator()));
  //! Datasources
  serviceLocator
      .registerLazySingleton<FirebaseAuthenticationRegisterRemoteDataSource>(
          () => FirebaseAuthenticationRegisterRemoteDataSource());
  serviceLocator
      .registerLazySingleton<FirebaseAuthenticationLoginRemoteDataSource>(
          () => FirebaseAuthenticationLoginRemoteDataSource());
  serviceLocator.registerLazySingleton<FirestoreUser>(() => FirestoreUser());
//! Core

//! External
}
