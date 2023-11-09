import 'package:flutter/material.dart';
import 'package:text_app_toy/main_screen.dart';
import 'package:text_app_toy/text_field_join.dart';
import 'bottom_navigationbar.dart';

void main() {
  runApp(const login());
}

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<StatefulWidget> createState() {
    return login_state();
  }
}

class login_state extends State<login> {
  String userEmail = '';
  String userPassWord = '';

  final _formkey = GlobalKey<FormState>();

  void _tryValidation() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                '회원가입 또는 로그인을 진행하세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.contains('@')) {
                        return '알맞은 이메일 형식을 입력하세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userEmail = value!;
                    },
                    onChanged: (value) {
                      userEmail = value;
                    },
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      labelText: '이메일을 입력하세요.',
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return '비밀번호는 4글자 이상입니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPassWord = value!;
                    },
                    onChanged: (value) {
                      userPassWord = value;
                    },
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 69, 69, 69)),
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      labelText: '비밀번호를 입력하세요.',
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Main_Screen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/join');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                '회원가입',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
