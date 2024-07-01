import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/theme/pallete.dart';
import 'package:url_launcher/url_launcher.dart';


class TwitterHeader extends StatelessWidget {
  const TwitterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 90),
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Pallete.blueColor,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset(
            AssetsConstants.twitterLogo,
          ),
        ),
      ],
    );
  }
}

class CommonTwitterHeader extends TwitterHeader {
  const CommonTwitterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 95),
        super.build(context), // Calls build method of BirdBar to display Twitter icon
      ],
    );
  }
}

class XTwitterHeader extends TwitterHeader {
  const XTwitterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 14),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login_view'); // Navigation to login screen on X icon tap
          },
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Pallete.blueColor,
              BlendMode.srcIn,
            ),
            child: SvgPicture.asset(
              AssetsConstants.xIcon,
              width: 14,
              height: 14,
            ),
          ),
        ),
        const SizedBox(width: 67),
        super.build(context), // Calls build method of BirdBar to display Twitter icon
      ],
    );
  }
}

class BackTwitterHeader extends TwitterHeader {
  const BackTwitterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Navigation back on Back icon tap
          },
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Pallete.blueColor,
              BlendMode.srcIn,
            ),
            child: SvgPicture.asset(
              AssetsConstants.backIcon,
              width: 13,
              height: 13,
            ),
          ),
        ),
        const SizedBox(width: 68), // 68 units spacing
        super.build(context), // Calls build method of BirdBar to display Twitter icon
      ],
    );
  }
}

class Space extends StatelessWidget {
  final double height;
  const Space({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class LargeText extends StatelessWidget {
  final String text;

  const LargeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 28, color: Pallete.whiteColor),
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40), 
      alignment: Alignment.centerLeft, 
      child: Text.rich(
        TextSpan(
          text: 'By signing up, you agree to our ',
          style: const TextStyle(fontSize: 8, color: Pallete.geryWhiteColor),
          children: <TextSpan>[
            TextSpan(
              text: 'Terms',
              style: const TextStyle(color: Pallete.greyBlueColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://twitter.com/tos');
                },
            ),
            const TextSpan(
              text: ', ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(color: Pallete.greyBlueColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://twitter.com/privacy');
                },
            ),
            const TextSpan(
              text: ', and ',
            ),
            TextSpan(
              text: 'Cookie Use',
              style: const TextStyle(color: Pallete.greyBlueColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launch('https://twitter.com/cookies');
                },
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), 
      alignment: Alignment.centerLeft, 
      child: RichText(
        text: TextSpan(
          text: 'Have an account already? ',
          style: const TextStyle(color: Pallete.geryWhiteColor),
          children: <TextSpan>[
            TextSpan(
              text: 'Log in',
              style: const TextStyle(color: Pallete.greyBlueColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to login screen
                },
            ),
          ],
        ),
      ),
    );
  }
}

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

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300, 
      child: Row(
        children: [
          Expanded(child: Divider(color: Pallete.geryWhiteColor)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Text("or", style: TextStyle(color: Pallete.geryWhiteColor)),
          ),
          Expanded(child: Divider(color: Pallete.geryWhiteColor)),
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
        // Navigate to Create Account screen
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