import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  final TextEditingController _controller = TextEditingController();

  void _nextPage() {
    setState(() {
      userData.password = _controller.text;
    });
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const XTwitterHeader(),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: LargeText(text: "Enter your password"),
              ),
            ),
            const SizedBox(height: 20),
            CustomPasswordField(
              hintText: 'Password',
              controller: _controller,
            ),
            const SizedBox(height: 470),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationLogin(
        nextPageRoute: '/login',
        userData: userData,
        createUser: createEmailUser,
        enableCreateFunctionality: true,
      ),
    );
  }
}