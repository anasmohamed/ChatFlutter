import 'package:chat/features/login/presentaion/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../features/register/presentation/cubit/register_cubit.dart';
import '../../features/register/presentation/screens/register_screen.dart';
import '/injection_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => RegisterScreen()));

      // return MaterialPageRoute(builder: ((context) => LoginScreen()));
      case Routes.loginRoute:
        return MaterialPageRoute(builder: ((context) => LoginScreen()));

      // return MaterialPageRoute(builder: ((context) => LoginScreen()));
      case Routes.registerRoute:
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: ((context) => di.serviceLocator<RegisterCubit>()),
            child: RegisterScreen(),
          );
        }));

      default:
        return undefindRoute();
    }
  }

  static Route<dynamic> undefindRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
