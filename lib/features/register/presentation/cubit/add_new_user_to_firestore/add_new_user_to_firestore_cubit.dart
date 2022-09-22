import 'package:chat/features/register/data/models/user_data_model.dart';
import 'package:chat/features/register/domain/usecases/add_new_user_to_firestore_usecase.dart';
import 'package:chat/features/register/presentation/cubit/add_new_user_to_firestore/add_new_user_to_firestore_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserToFirestoreCubit extends Cubit<AddUserToFirestoreStates> {
  final AddNewUserToFirestoreUseCase addNewUserToFirestoreUseCase;

  AddUserToFirestoreCubit({required this.addNewUserToFirestoreUseCase})
      : super(AddUserToFirestoreInitialState());

  static AddUserToFirestoreCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> addNewUser(UserDataModel newUserInfo) async {
    emit(AddUserToFirestoreAddingState());
    addNewUserToFirestoreUseCase.call(params: newUserInfo).then((userInfo) {
      emit(AddUserToFirestoreAddedState());
    }).catchError((e) {
      emit(AddUserToFirestoreErrorState(e));
    });
  }
}
