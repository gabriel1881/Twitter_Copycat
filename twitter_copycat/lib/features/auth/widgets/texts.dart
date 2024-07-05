import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/theme/pallete.dart';
import 'package:url_launcher/url_launcher.dart';

//Renders large text with padding and a specific font size.
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
        style: const TextStyle(fontSize: 25.3, color: Pallete.whiteColor),
      ),
    );
  }
}

//Displays a rich text with clickable links to Terms, Privacy Policy, and Cookie Use.
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
                  launch('https://x.com/en/tos');
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
                  launch('https://x.com/en/privacy');
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
                  launch('https://help.x.com/en/rules-and-policies/x-cookies');
                },
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

//Provides a text link for navigating to the login screen.
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
                  Navigator.pushNamed(context, '/login');// Navigate to login screen
                },
            ),
          ],
        ),
      ),
    );
  }
}

//A customizable text field widget with optional max length and controller.
class CustomTextField extends StatefulWidget {
  final String hintText;
  final int? maxLength;
  final TextEditingController? controller; 

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLength,
    this.controller, 
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  bool _hasText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: _controller,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: _hasText ? Colors.transparent : Pallete.greyColor),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.greyColor, width: 1.0),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.blueColor, width: 1.0),
              ),
              counterText: '',
            ),
            style: const TextStyle(color: Pallete.whiteColor),
            inputFormatters: widget.maxLength != null
                ? [LengthLimitingTextInputFormatter(widget.maxLength)]
                : null,
          ),
        ),
      ],
    );
  }
}

//Extends CustomTextField to include a character counter.
class CustomTextFieldWithCounter extends CustomTextField {
  const CustomTextFieldWithCounter({
    super.key,
    required super.hintText,
    required int super.maxLength,
    super.controller, // Añadir el controlador
  }); // Pasar el controlador

  @override
  _CustomTextFieldWithCounterState createState() => _CustomTextFieldWithCounterState();
}

class _CustomTextFieldWithCounterState extends _CustomTextFieldState {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: _controller,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: _hasText ? Colors.transparent : Pallete.greyColor),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.greyColor, width: 1.0),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.blueColor, width: 1.0),
              ),
              counterText: '',
            ),
            style: const TextStyle(color: Pallete.whiteColor),
            inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '${_controller.text.length}/${widget.maxLength}',
              style: const TextStyle(color: Pallete.greyColor),
            ),
          ),
        ),
      ],
    );
  }
}

//A password field widget with toggleable visibility.
class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller; 

  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.controller,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        // Solo para actualizar la UI cuando se cambie el texto
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            controller: _controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: _controller.text.isNotEmpty ? Colors.transparent : Pallete.greyColor,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.greyColor, width: 1.0),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Pallete.blueColor, width: 1.0),
              ),
              counterText: '',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    AssetsConstants.eyeIcon,
                    color: Pallete.greyColor,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            style: const TextStyle(color: Pallete.whiteColor),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '•' * _controller.text.length,
              style: const TextStyle(color: Pallete.whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}