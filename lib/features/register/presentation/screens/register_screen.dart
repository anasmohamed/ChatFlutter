import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/registe_user_requset_model.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../../../../core/widgets/default_text_field.dart';
import '/injection_container.dart' as di;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailTextEditingController = TextEditingController();
    var passwordTextEditingController = TextEditingController();
    var phoneTextEditingController = TextEditingController();
    var nameTextEditingController = TextEditingController();
    return BlocProvider(
      create: (context) => di.serviceLocator<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
        if (state is RegisterSuccessStates) {
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

                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).registerUser(
                                  UserRequestModel(
                                      email: emailTextEditingController.text,
                                      password:
                                          passwordTextEditingController.text));
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
}
