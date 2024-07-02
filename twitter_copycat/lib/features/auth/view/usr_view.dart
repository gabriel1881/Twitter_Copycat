import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class UsrView extends StatelessWidget {
  const UsrView({super.key});

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
                child: LargeText(text: "To get started, first enter your phone, email, or @username"),
              ),
            ),
            SizedBox(height: 20), 
            CustomTextField(
              hintText: 'Phone, email, or username',
            ),
            SizedBox(height: 400), 
            CustomBottomNavigationWithPass(
              nextPageRoute: '/pass', 
            ),
          ],
        ),
      ),
    );
  }
}