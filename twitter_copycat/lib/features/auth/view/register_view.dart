import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  void _nextPage() {
    setState(() {
      userData.name = _nameController.text;
      userData.email = _emailPhoneController.text.contains('@') ? _emailPhoneController.text : null;
      userData.phone = RegExp(r'^[0-9]+$').hasMatch(_emailPhoneController.text) ? _emailPhoneController.text : null;
      userData.dateOfBirth = _dobController.text;
    });

    // Print the user's name to check if it's saved correctly
    print('User name: ${userData.name}');
    print('User email: ${userData.email}');
    print('User birth: ${userData.dateOfBirth}');
    Navigator.pushNamed(context, '/usr');
  }

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
                child: LargeText(text: "Create your account"),
              ),
            ),
            const Space(height: 200),
            CustomTextFieldWithCounter(
              hintText: 'Name',
              maxLength: 50,
              controller: _nameController,
            ),
            const Space(height: 20),
            CustomTextField(
              hintText: 'Phone number or email address',
              controller: _emailPhoneController,
            ),
            const Space(height: 20),
            CustomTextField(
              hintText: 'Date of birth         DD/MM/YYYY',
              controller: _dobController,
            ),
            const Space(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        nextPageRoute: '/usr',
        onTap: _nextPage,
      ),
    );
  }
}