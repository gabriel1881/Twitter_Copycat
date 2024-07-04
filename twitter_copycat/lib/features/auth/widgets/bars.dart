import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/theme/pallete.dart';
import 'package:twitter_copycat/theme/theme.dart';
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
            Navigator.pushNamed(context, '/start'); // Navigation to login screen on X icon tap
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
        const SizedBox(width: 68),
        super.build(context), // Calls build method of BirdBar to display Twitter icon
      ],
    );
  }
}

class HomeTwitterHeader extends TwitterHeader {
  const HomeTwitterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Hamburger icon on the left
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsConstants.hamburgerIcon,
              width: 17,
              height: 17,
            color: Pallete.blueColor,
          ),
        ),
        const Spacer(),
        super.build(context), // Calls build method of TwitterHeader to display Twitter icon
        const Spacer(),
        const SizedBox(width: 76),
        // Stars icon on the right
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsConstants.starsIcon,
              width: 25,
              height: 25,
            color: Pallete.blueColor,
          ),
        ),
      ],
    );
  }
}

class RegisterNavBar extends StatelessWidget {
  final String nextPageRoute;
  final VoidCallback? onTap;

  const RegisterNavBar({
    super.key,
    required this.nextPageRoute,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Pallete.greyBackgroundColor,
        border: Border(top: BorderSide(color: Pallete.greyColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap ?? () {
              Navigator.pushNamed(context, nextPageRoute);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Pallete.greyBlueColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UsrNavBar extends StatelessWidget {
  final String nextPageRoute;
  final VoidCallback? onTap;

  const UsrNavBar({
    super.key,
    required this.nextPageRoute,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Pallete.greyBackgroundColor,
        border: Border(top: BorderSide(color: Pallete.greyColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              launch('https://help.x.com/en/forms/account-access/regain-access/forgot-password');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Pallete.blueColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap ?? () {
              Navigator.pushNamed(context, nextPageRoute);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Pallete.greyBlueColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: theme.primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: theme.scaffoldBackgroundColor,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.homeFilledIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 0 ? theme.primaryColor : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.searchIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 1 ? theme.primaryColor : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.notifOutlinedIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 2 ? theme.primaryColor : Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.mailIcon,
            width: 27,
            height: 27,
            color: _selectedIndex == 3 ? theme.primaryColor : Colors.grey,
          ),
          label: '',
        ),
      ],
    );
  }
}

class PassNavBar extends StatelessWidget {
  final String nextPageRoute;
  final Future<String> Function(String, String, String) createUser;
  final bool enableCreateFunctionality;
  final TextEditingController passwordController;

  const PassNavBar({
    super.key,
    required this.nextPageRoute,
    required this.createUser,
    this.enableCreateFunctionality = false,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Pallete.greyBackgroundColor,
        border: Border(top: BorderSide(color: Pallete.greyColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              launch('https://help.x.com/en/forms/account-access/regain-access/forgot-password');
            },
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: Pallete.blueColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              // Verificar y crear usuario
              String password = passwordController.text;
              if (enableCreateFunctionality) {
                String result = await createUser(
                  userData.name ?? '',
                  userData.email ?? '',
                  password,
                );
                print("Registration Result: $result");
                if (result == "success") {
                  Navigator.pushNamed(context, '/login');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User data is incomplete."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Pallete.blueColor,
              ),
              child: const Text(
                'Log in',
                style: TextStyle(
                  color: Pallete.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginNavBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginNavBar({super.key, 
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Pallete.greyBackgroundColor,
        border: Border(top: BorderSide(color: Pallete.greyColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              launch('https://help.x.com/en/forms/account-access/regain-access/forgot-password');
            },
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: Pallete.blueColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                // Clear previous user data
                userData.name = null;
                userData.email = null;
                userData.phone = null;
                userData.username = null;
                userData.dateOfBirth = null;
                userData.password = null;

                // Set new user data
                userData.username = usernameController.text.trim();
                userData.password = passwordController.text;

                loginUser(
                  usernameController.text.trim(),
                  passwordController.text,
                ).then((result) {
                  if (result == "success") {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Login failed: $result",
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red.shade400,
                      ),
                    );
                  }
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Pallete.blueColor,
              ),
              child: const Text(
                'Log in',
                style: TextStyle(
                  color: Pallete.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}