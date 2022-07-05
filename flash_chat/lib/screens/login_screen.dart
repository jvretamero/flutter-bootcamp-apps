import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/progress_hud.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                text: 'Log In',
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
                    await _auth.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );

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
