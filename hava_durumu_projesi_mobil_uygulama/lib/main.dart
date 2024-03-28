import 'package:flutter/material.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/screens/loading_screen.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/screens/main_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
        home: loadingScreen(),




    );
  }
}

