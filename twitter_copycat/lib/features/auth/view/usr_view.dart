import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class UsrView extends StatefulWidget {
  const UsrView({super.key});

  @override
  State<UsrView> createState() => _UsrViewState();
}

class _UsrViewState extends State<UsrView> {
  final TextEditingController _controller = TextEditingController();

  void _nextPage() {
    setState(() {
      final text = _controller.text;
      if (RegExp(r'^[0-9]+$').hasMatch(text)) {
        userData.phone = text;
      } else if (text.contains('@')) {
        userData.email = text;
      } else {
        userData.username = text;
      }
    });

    Navigator.pushNamed(context, '/pass');
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
                child: LargeText(text: "To get started, first enter your phone, email, or @username"),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'Phone, email, or username',
              controller: _controller,
            ),
            const SizedBox(height: 400),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationWithPass(
        nextPageRoute: '/pass',
      ),
    );
  }
}