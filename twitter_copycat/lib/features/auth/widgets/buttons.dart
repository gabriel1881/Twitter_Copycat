import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Google Login
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.whiteColor,
        foregroundColor: Pallete.backgroundColor,
        minimumSize: const Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AssetsConstants.googleIcon, 
            height: 24.0, 
            width: 24.0,
          ),
          const SizedBox(width: 150), 
        ],
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/register');// Navigate to Create Account screen
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.greyBlueColor,
        foregroundColor: Pallete.whiteColor,
        minimumSize: const Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: const Text("Create account"),
    );
  }
}

class FeatherButton extends StatelessWidget {
  const FeatherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/tweet');
      },
      icon: SvgPicture.asset(
        AssetsConstants.featherIcon,
        width: 45,
        height: 45,
        color: Pallete.blueColor, // Color del tema (enfoque en el color de acento)
      ),
    );
  }
}