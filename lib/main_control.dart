import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:text_app_toy/firebase_options.dart';
import 'package:text_app_toy/join.dart';
import 'Intro_screen.dart';
import 'main_screen.dart';
import 'login.dart';
import 'bottom_navigationbar.dart';

//d
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //플러터에서 파이어베이스를 사용하기 위해 매인메소드 안에서 비동기방식을 사용하기 위해 사용하는 함수
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //위와 동일

  runApp(const main_control());
}

class main_control extends StatelessWidget {
  const main_control({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, background: Colors.black),
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Intro',
      routes: {
        '/Intro': (context) => const SplashScreen(),
        '/login': (context) => const login(),
        '/main_screen': (context) => const Main_Screen(),
        '/join': (context) => const join(),
      },
    );
  }
}
