import 'package:flutter/material.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/style.dart';
import 'package:student_provider/view/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kwhite,
          foregroundColor: kblack,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: kblack,
            titleTextStyle: text20WhiteBold,
            iconTheme: const IconThemeData(color: kwhite),
            elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
