import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_or_registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: _columWrapper(
          children: [
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            StreamBuilder<User?>(
              stream: _auth.authStateChanges(),
              builder: (context, snapshot) => _columWrapper(
                children: snapshot.hasData
                    ? _authenticatedUserButtons()
                    : _unauthenticatedUserButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _columWrapper({required List<Widget> children}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );

  List<Widget> _authenticatedUserButtons() {
    return [
      Text(
        'You are authenticated as ${_auth.currentUser!.email!}',
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 16.0,
      ),
      const Text(
        'Do you want to continue?',
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 48.0,
      ),
      RoundedButton(
        text: 'Continue',
        color: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.pushNamed(context, ChatScreen.route);
        },
      ),
      RoundedButton(
        text: 'Log out',
        color: Colors.blueAccent,
        onPressed: () async {
          await _auth.signOut();
          setState(() {});
        },
      ),
    ];
  }

  List<Widget> _unauthenticatedUserButtons() {
    return [
      RoundedButton(
        text: 'Log In',
        color: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.pushNamed(context, LoginOrRegistrationScreen.loginRoute);
        },
      ),
      RoundedButton(
        text: 'Register',
        color: Colors.blueAccent,
        onPressed: () {
          Navigator.pushNamed(
              context, LoginOrRegistrationScreen.registrationRoute);
        },
      ),
    ];
  }
}
