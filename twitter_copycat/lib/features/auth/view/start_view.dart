import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/buttons.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.08), 
            const CommonTwitterHeader(),
            SizedBox(height: screenHeight * 0.2), 
            const LargeText(text: "See what's happening in the world right now."),
            SizedBox(height: screenHeight * 0.2), 
            const GoogleButton(),
            const SizedBox(height: 10),
            const OrLine(),
            const SizedBox(height: 10),
            const CreateAccountButton(),
            const SizedBox(height: 30),
            const SmallText(),
            const SizedBox(height: 100),
            const LoginText(),
          ],
        ),
      ),
    );
  }
}