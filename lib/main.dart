import 'package:flutter/material.dart';
import 'package:test_ordo/app/page/home.dart';
import 'package:test_ordo/app/utils/ordo_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miftahur Rohman Habibie - MOBILE FE ORDO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: OrdoColors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: OrdoColors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w600,
            color: OrdoColors.black,
          ),
          labelMedium: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: OrdoColors.white,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: OrdoColors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: OrdoColors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: OrdoColors.black,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
