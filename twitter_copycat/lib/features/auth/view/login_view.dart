import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: LargeText(text: "Login in to Twitter"),
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Phone, email, or username',
              controller: _usernameController,
            ),
            SizedBox(height: 20),
            CustomPasswordField(
              hintText: 'Password',
              controller: _passwordController,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Lógica para iniciar sesión
                loginUser(
                  _usernameController.text.trim(), // Email, teléfono o nombre de usuario
                  _passwordController.text,
                ).then((result) {
                  if (result == "success") {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Login failed: $result",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red.shade400,
                      ),
                    );
                  }
                });
              },
              child: CustomBottomNavigationWithPass(
                nextPageRoute: '/home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}