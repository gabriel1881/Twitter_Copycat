import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/texts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController(); // Controller for the user's name input field.
  final TextEditingController _emailPhoneController = TextEditingController(); // Controller for email/phone input field.
  final TextEditingController _dobController = TextEditingController(); // Controller for date of birth input field.

  void _nextPage() {
    setState(() {
      userData.name = _nameController.text;
      userData.email =
          _emailPhoneController.text.contains('.com') ? _emailPhoneController.text : null; // Set email if valid.
      userData.phone = RegExp(r'^[0-9]+$').hasMatch(_emailPhoneController.text)  // Set phone number if valid.
          ? _emailPhoneController.text
          : null;
      userData.dateOfBirth = _dobController.text;
    });

    // Print the user's name to check if it's saved correctly
    print('User name: ${userData.name}');
    print('User email: ${userData.email}');
    print('User birth: ${userData.dateOfBirth}');
    Navigator.pushNamed(context, '/usr'); // Navigate to '/usr' route after data is set.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top + 10), 
          const BackTwitterHeader(),
          const SizedBox(height: 20), // Espacio arriba del título
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LargeText(text: "Create your account"),
          ),
          const SizedBox(height: 115), 
 
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20), 
                    CustomTextFieldWithCounter(
                      hintText: 'Name',
                      maxLength: 50,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 20), 
                    CustomTextField(
                      hintText: 'Phone number or email address',
                      controller: _emailPhoneController,
                    ),
                    const SizedBox(height: 20), 
                    CustomTextField(
                      hintText: 'Date of birth         DD/MM/YYYY',
                      controller: _dobController,
                    ),
                    const SizedBox(height: 20), 
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 50), 
        ],
      ),
      bottomNavigationBar: RegisterNavBar(
        nextPageRoute: '/usr',
        onTap: _nextPage,
      ),
    );
  }
}