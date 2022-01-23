import 'package:flash_chat/components/progress_hud.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const route = '/registration';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  late String _email;
  late String _password;

  void _setLoading({required bool isLoading}) => setState(() {
        _isLoading = isLoading;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHud(
        isLoading: _isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () async {
                  _setLoading(isLoading: true);

                  try {
                    await _auth.createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );

                    _setLoading(isLoading: true);
                    Navigator.pushNamed(context, ChatScreen.route);
                  } catch (e) {
                    print(e);
                    _setLoading(isLoading: true);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
