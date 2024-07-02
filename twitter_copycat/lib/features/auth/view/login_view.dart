import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/buttons.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommonTwitterHeader(),
            Space(height: 150),
            LargeText(text: "See what's happening in the world right now."),
            Space(height: 150),
            GoogleButton(),
            Space(height: 5),
            OrLine(),
            Space(height: 5),
            CreateAccountButton(),
            Space(height: 20),
            SmallText(),
            Space(height: 80),
            LoginText(),
          ],
        ),
      ),
    );
  }
}