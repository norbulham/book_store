import 'package:book_store_managestate/manage_states.dart';
import 'package:book_store_managestate/pages/bottom_nav.dart';
import 'package:book_store_managestate/pages/homepages.dart';
import 'package:book_store_managestate/pages/login_pages.dart';
import 'package:book_store_managestate/pages/profile_pages.dart';
import 'package:book_store_managestate/sign_pages.dart';
import 'package:book_store_managestate/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageState()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}