import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/features/index/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arkar Min',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const IndexPage(),
    );
  }
}


