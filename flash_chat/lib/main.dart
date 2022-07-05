import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/login_or_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (context) => const WelcomeScreen(),
        LoginOrRegistrationScreen.loginRoute: (context) =>
            const LoginOrRegistrationScreen(
              operation: LoginOrRegistrationOperation.login,
            ),
        LoginOrRegistrationScreen.registrationRoute: (context) =>
            const LoginOrRegistrationScreen(
              operation: LoginOrRegistrationOperation.registration,
            ),
        ChatScreen.route: (context) => const ChatScreen(),
      },
    );
  }
}
