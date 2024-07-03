import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const BackTwitterHeader(),
            const Space(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LargeText(text: "Enter your password"),
              ),
            ),
            const Space(height: 20),
            CustomPasswordField(
              hintText: 'Password',
              controller: _passwordController,
            ),
            const Space(height: 50),
            CustomBottomNavigationLogin(
              nextPageRoute: '/login',
              createUser: createEmailUser,
              enableCreateFunctionality: true,
              passwordController: _passwordController,
            ),
          ],
        ),
      ),
    );
  }
}