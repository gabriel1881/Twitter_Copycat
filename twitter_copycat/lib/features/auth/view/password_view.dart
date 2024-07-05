import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  final TextEditingController _passwordController = TextEditingController(); // Controller for the password input field.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10), 
          const BackTwitterHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10), 
                    const LargeText(text: "Enter your password"),
                    const SizedBox(height: 20),
                    CustomPasswordField(
                      hintText: 'Password',
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: PassNavBar(
        nextPageRoute: '/login',
        createUser: createEmailUser, // Function to create a user account using email/password.
        enableCreateFunctionality: true, // Enable the create functionality in the PassNavBar.
        passwordController: _passwordController,
      ),
    );
  }
}