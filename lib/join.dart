import 'package:flutter/material.dart';
import 'package:text_app_toy/login.dart';
import 'package:text_app_toy/text_field_join.dart';

void main() {
  runApp(const join());
}

class join extends StatefulWidget {
  const join({super.key});
  @override
  State<StatefulWidget> createState() {
    return join_state();
  }
}

class join_state extends State<join> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.black,
        ),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 250,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text_Field(
                  labelText: '이름을 입력하세요.',
                  hintText: '이름',
                  choice: 0,
                ),
                const Text_Field(
                    labelText: '이메일을 입력하세요.', hintText: '이메일', choice: 1),
                const Text_Field(
                  labelText: '비밀번호를 입력하세요.',
                  hintText: '비밀번호',
                  choice: 2,
                ),
                const Text_Field(
                  labelText: '비밀번호를 재입력하세요.',
                  hintText: '비밀번호 확인',
                  choice: 2,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                        (route) => false);
                  },
                  child: const Text(
                    '회원가입 완료',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
