import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/message_provider.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MessageProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'navigate_route + provider',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeScreen(),
      // (ไม่จำเป็นต้องใช้ named route สำหรับการบ้านนี้)
    );
  }
}
