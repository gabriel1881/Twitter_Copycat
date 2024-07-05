import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await signInWithGoogle(); 
        Navigator.of(context).pushReplacementNamed('/home');
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
            height: 18.0,
            width: 18.0,
          ),
          const SizedBox(width: 12), 
          const Text('Sign in with Google'), 
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
  const FeatherButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Pallete.blueColor, // Color de fondo circular
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/tweet');
        },
        icon: SvgPicture.asset(
          AssetsConstants.featherIcon,
          width: 35,
          height: 35,
          color: Colors.white, // Color del icono SVG
        ),
      ),
    );
  }
}