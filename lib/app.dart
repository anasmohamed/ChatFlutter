import 'package:chat/config/routes/app_routes.dart';
import 'package:chat/features/login/presentaion/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_strings.dart';
import 'features/register/presentation/screens/register_screen.dart';

class MyApp extends StatelessWidget {
  final Widget mainScreen;

  const MyApp({Key? key, required this.mainScreen}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainScreen,
    );
  }
}
