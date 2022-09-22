import 'package:chat/features/register/data/models/user_data_model.dart';
import 'package:chat/features/register/domain/usecases/add_new_user_to_firestore_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/registe_user_requset_model.dart';
import '../cubit/add_new_user_to_firestore/add_new_user_to_firestore_cubit.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../../../../core/widgets/default_text_field.dart';
import '/injection_container.dart' as di;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  String? uid;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var emailTextEditingController = TextEditingController();
    var passwordTextEditingController = TextEditingController();
    var phoneTextEditingController = TextEditingController();
    var nameTextEditingController = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.serviceLocator<RegisterCubit>()),
        BlocProvider(
            create: (context) => di.serviceLocator<AddUserToFirestoreCubit>())
      ],
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, registerState) {
        if (registerState is RegisterLoadingStates) {
          buildShowDialog(context);
        } else {
          if (registerState is RegisterSuccessStates) {
            uid = registerState.user.uid;
            if (uid != null) {
              AddUserToFirestoreCubit addUserToFirestoreCubit =
                  AddUserToFirestoreCubit.get(context);
              addUserToFirestoreCubit
                  .addNewUser(UserDataModel(
                      email: emailTextEditingController.text,
                      name: nameTextEditingController.text,
                      phone: phoneTextEditingController.text,
                      uId: uid!,
                      image: "",
                      cover: "",
                      bio: "",
                      isEmailVerified: true))
                  .then((value) {
                Navigator.of(context).pop();
                isLoading = false;
              }).catchError((error) {
                debugPrint("error $error}");
              });
            }
          }
          // if (state.user.)
          // {
          //   print(state.baseResponseModel.message);
          //   print(state.baseResponseModel.data!.token);

          //   // CacheHelper.saveDate(
          //   //   key: 'token',
          //   //   value: state.baseResponseModel.data!.token,
          //   // ).then((value)
          //   // {
          //   //   token = state.baseResponseModel.data!.token;

          //   //   navigateAndFinish(
          //   //     context,
          //   //     ShopBaseLayout(),
          //   //   );
          //   // });
          // } else {
          //   print(state.baseResponseModel.message);

          //   // showToast(
          //   //   text: state.baseResponseModel.message,
          //   //    ToastStates: ToastStates.ERROR,
          //   // );
          // }
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Register now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultTextField(
                        controller: nameTextEditingController,
                        textInputType: TextInputType.name,
                        placeholderString: "Full Name",
                        validator: (String value) {
                          if (value == "" || value == null) {
                            return "Full Name is Required";
                          }
                        },
                        prefix: Icons.person,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextField(
                        controller: emailTextEditingController,
                        textInputType: TextInputType.emailAddress,
                        placeholderString: "Email Address",
                        validator: (String value) {
                          if (value == "" || value == null) {
                            return "Email Address is Required";
                          }
                        },
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextField(
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          isPassword: RegisterCubit.get(context).isPassword,
                          controller: passwordTextEditingController,
                          textInputType: TextInputType.visiblePassword,
                          placeholderString: "Password",
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password is Required";
                            }
                          },
                          prefix: Icons.lock_outline,
                          suffixIcon: RegisterCubit.get(context)
                              .suffixIconForPasswordTextField),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultTextField(
                        controller: phoneTextEditingController,
                        textInputType: TextInputType.phone,
                        placeholderString: "Phone Number",
                        validator: (String value) {
                          if (value == "" || value == null) {
                            return "Phone Number is Required";
                          }
                        },
                        prefix: Icons.phone_iphone_outlined,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                          function: () {
                            print("anas clicked");
                            isLoading = true;
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context)
                                  .registerUser(UserRequestModel(
                                      email: emailTextEditingController.text,
                                      password:
                                          passwordTextEditingController.text))
                                  .then((value) {});
                            }
                          },
                          text: "Register"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
