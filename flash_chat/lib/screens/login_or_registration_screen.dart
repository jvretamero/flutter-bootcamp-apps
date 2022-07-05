import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/progress_hud.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'welcome_screen.dart';

enum LoginOrRegistrationOperation {
  login,
  registration,
}

class LoginOrRegistrationScreen extends StatefulWidget {
  static const loginRoute = '/login';
  static const registrationRoute = '/registration';

  final LoginOrRegistrationOperation operation;

  const LoginOrRegistrationScreen({
    Key? key,
    required this.operation,
  }) : super(key: key);

  @override
  State<LoginOrRegistrationScreen> createState() =>
      _LoginOrRegistrationScreenState();
}

class _LoginOrRegistrationScreenState extends State<LoginOrRegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _setLoading({required bool isLoading}) => setState(() {
        _isLoading = isLoading;
      });

  Future showMessage(BuildContext context, String message) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );

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
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  errorText: _emailError,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  errorText: _passwordError,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: widget.operation == LoginOrRegistrationOperation.login
                    ? 'Log In'
                    : 'Register',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  _emailError = null;
                  _passwordError = null;

                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    setState(() {
                      _emailError = _emailController.text.isEmpty
                          ? 'The email is required'
                          : null;

                      _passwordError = _passwordController.text.isEmpty
                          ? 'The password is required'
                          : null;
                    });
                    return;
                  }

                  _setLoading(isLoading: true);

                  try {
                    if (widget.operation ==
                        LoginOrRegistrationOperation.login) {
                      await _auth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    } else {
                      await _auth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }

                    _setLoading(isLoading: false);
                    Navigator.pushNamed(context, ChatScreen.route);
                  } on FirebaseAuthException catch (e) {
                    _setLoading(isLoading: false);
                    await showMessage(context, e.message ?? 'Unknown error');
                  }
                },
              ),
              RoundedButton(
                text: 'Back',
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, WelcomeScreen.route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
