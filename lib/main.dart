import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/constants/colors.dart';
import 'package:student_provider/constants/style.dart';
import 'package:student_provider/controller/database/db_functions.dart';
import 'package:student_provider/controller/provider/student_model_provider.dart';
import 'package:student_provider/view/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DB sql = DB();
  await sql.initialiseDatabase();
  runApp(ChangeNotifierProvider(
      create: (_) => StudentModelProvider(), child: const MyApp()));
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
          backgroundColor: kblack,
          foregroundColor: kwhite,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: kgreenAccent,
            titleTextStyle: text20BlackBold,
            iconTheme: const IconThemeData(color: kblack),
            elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
