import 'package:flutter/material.dart';
import 'package:sadeem/features/product/presentation/pages/login_screen.dart';
import 'core/network/dio_helper.dart';
import 'features/home.dart';
import 'features/product/presentation/pages/products_screen.dart';
import 'injection_container.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF051A52),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}





