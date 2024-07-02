import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            XTwitterHeader(),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: LargeText(text: "Enter your password"),
              ),
            ),
            SizedBox(height: 20),
            CustomPasswordField(
              hintText: 'Password',
            ),
            SizedBox(height: 470),
            CustomBottomNavigationWithPass(
              nextPageRoute: '/login',
            ),
          ],
        ),
      ),
    );
  }
}