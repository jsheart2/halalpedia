import 'package:flutter/widgets.dart';
import 'package:halalpedia/home/home_screen.dart';

import 'package:halalpedia/sign_in/sign_in_screen.dart';
import 'package:halalpedia/splash/splash_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
