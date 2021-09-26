import 'package:avaliacao_framework_shop/features/cart/cart_controller.dart';
import 'package:avaliacao_framework_shop/features/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'app_styles/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  GetIt.I.registerSingleton(CartController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FrameWorkShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.purple,
        ),
        scaffoldBackgroundColor: AppColors.purple,
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.green,
            selectionHandleColor: AppColors.green),
      ),
      home: LoginScreen(),
    );
  }
}
