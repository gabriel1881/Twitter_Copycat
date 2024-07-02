import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class RegisterView extends StatefulWidget{
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override 
  Widget build(BuildContext context) {
    return const Scaffold(
      // The main body of the registration view
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The Header
            BackTwitterHeader(),
            Space(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: LargeText(text: "Create your account"),
              ),
            ),
            Space(height: 200),
            CustomTextFieldWithCounter(
              hintText: 'Name',
              maxLength: 50,
            ),
            Space(height: 20),
            CustomTextField(
              hintText: 'Phone number or email address',
            ),
            Space(height: 20),
            CustomTextField(
              hintText: 'Date of birth         DD/MM/YYYY',
            ),
            Space(height: 50),
          ],
        ),
      ),
      // Bottom nav bar
      bottomNavigationBar: CustomBottomNavigation(
        nextPageRoute: '/usr', 
      ),
    );
  }
}