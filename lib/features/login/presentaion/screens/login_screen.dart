import 'package:chat/features/login/presentaion/cubit/login_cubit.dart';
import 'package:chat/features/register/data/models/registe_user_requset_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/widgets/default_text_button.dart';
import '../../../../core/widgets/default_text_field.dart';
import '../../../register/presentation/screens/register_screen.dart';
import '../cubit/login_states.dart';
import '/injection_container.dart' as di;

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _goRegisterUserScreen() =>
        Navigator.pushReplacementNamed(context, Routes.registerRoute);

    var emailTextEditingController = TextEditingController();
    var passwordTextEditingController = TextEditingController();
    return BlocProvider(
      create: (context) => di.serviceLocator<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        if (state is LoginSuccessStates) {
          CacheHelper.saveData(key: 'uId', value: state.user.uid);

          // if (state.baseResponseModel.status) {
          //   showToast(
          //       text: state.baseResponseModel.message,
          //       ToastStates: ToastStates.SUCESS);
          //   CacheHelper.saveDate(
          //           key: 'token', value: state.baseResponseModel.data!.token)
          //       .then((value) {
          //     token = state.baseResponseModel.data!.token;

          //     navigateAndFinish(context, ShopBaseLayout());
          //   });
          // } else {
          //   showToast(
          //       text: state.baseResponseModel.message,
          //       ToastStates: ToastStates.ERROR);
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
                        'Login',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30.0,
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
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextField(
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          isPassword: LoginCubit.get(context).isPassword,
                          controller: passwordTextEditingController,
                          textInputType: TextInputType.visiblePassword,
                          placeholderString: "Password",
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Password is Required";
                            }
                          },
                          prefix: Icons.lock_outline,
                          suffixIcon: LoginCubit.get(context)
                              .suffixIconForPasswordTextField),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                          function: () {
                            print("anas clicked");

                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).loginUser(
                                  UserRequestModel(
                                      email: emailTextEditingController.text,
                                      password:
                                          passwordTextEditingController.text));
                            }
                          },
                          text: "Login"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an accout?"),
                          defaultTextButton(
                              function: () {
                                _goRegisterUserScreen();
                              },
                              text: "Register")
                        ],
                      )
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
