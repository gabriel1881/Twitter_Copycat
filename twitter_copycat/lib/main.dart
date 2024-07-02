import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/view/home_view.dart';
import 'package:twitter_copycat/features/auth/view/login_view.dart';
import 'package:twitter_copycat/features/auth/view/start_view.dart';
import 'package:twitter_copycat/features/auth/view/password_view.dart';
import 'package:twitter_copycat/features/auth/view/register_view.dart';
import 'package:twitter_copycat/features/auth/view/usr_view.dart';
import 'package:twitter_copycat/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Copycat',
      theme: NightTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartView(), // Ruta inicial
        '/start': (context) => const StartView(),
        '/register': (context) => const RegisterView(),
        '/usr': (context) => const UsrView(),
        '/pass': (context) => const PasswordView(),
        '/login': (context) => const LoginView(),
        '/home' : (context) => const HomeView(),
      },
    );
  }
}