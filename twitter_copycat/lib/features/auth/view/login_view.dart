import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController(); // Controller for the username input field.
  final TextEditingController _passwordController = TextEditingController(); // Controller for the password input field.
  final formKey = GlobalKey<FormState>();  // GlobalKey for the login form.

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: screenHeight * 0.08),
                      const XTwitterHeader(),
                      SizedBox(height: screenHeight * 0.15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          child: LargeText(text: "Login in to Twitter"),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      CustomTextField(
                        hintText: 'Phone, email, or username',
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),
                      CustomPasswordField(
                        hintText: 'Password',
                        controller: _passwordController,
                      ),
                      SizedBox(height: screenHeight * 0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          LoginNavBar(
            formKey: formKey,
            usernameController: _usernameController,
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }
}