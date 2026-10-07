import 'package:flutter/material.dart';
import 'package:pro_task3/screens/account_screen.dart';
import 'package:pro_task3/screens/cart_screen.dart';
import 'package:pro_task3/screens/create_account_screen.dart';
import 'package:pro_task3/screens/details_screen.dart';
import 'package:pro_task3/screens/home_screen.dart';
import 'package:pro_task3/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/login_screen',
      routes: {
        '/login_screen': (context) => LoginScreen(),
        '/create_account_screen': (context) => CreateAccountScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/details_screen': (context) => DetailsScreen(),
        '/cart_screen': (context) => CartScreen(),
        '/account_screen': (context) => AccountScreen(),
      },
    );
  }
}
