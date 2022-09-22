import 'package:chat/app.dart';
import 'package:chat/features/home_screen/presentation/screens/home_screen.dart';
import 'package:chat/features/login/presentaion/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/cache_helper.dart';
import 'injection_container.dart' as di;

import 'AppBlocObserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget mainScreen;
  await Firebase.initializeApp();
  await CacheHelper.init();
  var uId = CacheHelper.getData(key: 'uId');
  if (uId != null) {
    mainScreen = const HomeScreen();
  } else {
    mainScreen = LoginScreen();
  }
  di.init();

  Bloc.observer = AppBlocObserver();

  runApp(MyApp(
    mainScreen: mainScreen,
  ));
}
