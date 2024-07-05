import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/theme/pallete.dart';
import 'package:twitter_copycat/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget displaying the Twitter logo in a row
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

// Widget extending TwitterHeader, minor layout adjustment
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

// Widget extending TwitterHeader, with an X icon to navigate back to the start screen
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

// Widget extending TwitterHeader, with a back icon to navigate back
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

// Widget extending TwitterHeader, specific to the home screen with additional icons
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

// Widget for the navigation bar during registration with a 'Next' button
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

// Widget for the navigation bar during user input with a 'Next' button
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

// Widget for the bottom navigation bar on the home screen
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

// Displays a navigation bar at the bottom of a view related to password-based registration.
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

//Validates user input and attempts to log in when the form is valid, navigating to the home screen upon successful login or displaying an error message if login fails.
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

//Displays a row of user icons with names, representing a section dedicated to user stories or similar content.
class StoriesHeader extends StatelessWidget {
  const StoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 30; // Tamaño del icono reducido
    const double circleSize = 45; // Tamaño del círculo contenedor

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildUserIcon('Add', iconSize, circleSize),
          _buildUserIcon('Gabriel', iconSize, circleSize),
          _buildUserIcon('Esteban', iconSize, circleSize),
          _buildUserIcon('Sofia', iconSize, circleSize),
          _buildUserIcon('Facundo', iconSize, circleSize),
        ],
      ),
    );
  }

  Widget _buildUserIcon(String name, double iconSize, double circleSize) {
    return Column(
      children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Pallete.greyBackgroundColor,
          ),
          child: Center(
            child: SvgPicture.asset(
              AssetsConstants.userIcon,
              width: iconSize,
              height: iconSize,
              color: Pallete.geryWhiteColor,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            color: Pallete.greyColor,
          ),
        ),
      ],
    );
  }
}