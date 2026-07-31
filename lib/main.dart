import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/features/screens/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami app',
      routes: {AppRoutes.mainLayoutRoute: (_) => MainLayout()},
      initialRoute: AppRoutes.mainLayoutRoute,
    );
  }
}
