import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/theme/pallete.dart';
import 'package:twitter_copycat/theme/theme.dart';


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

class CustomBottomNavigation extends StatelessWidget {
  final String nextPageRoute;

  const CustomBottomNavigation({
    super.key,
    required this.nextPageRoute,
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
            onTap: () {
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

class CustomBottomNavigationWithPass extends StatelessWidget {
  final String nextPageRoute;

  const CustomBottomNavigationWithPass({
    super.key,
    required this.nextPageRoute,
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
              // Navigate to Forgot Password screen (to be implemented)
              Navigator.pushNamed(context, '/forgot_password');
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
                  fontSize: 14, // Tamaño de texto ajustado
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
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

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
      selectedItemColor: theme.primaryColor, // Color azul para el ícono seleccionado
      unselectedItemColor: Colors.grey, // Color gris para el ícono no seleccionado
      backgroundColor: theme.scaffoldBackgroundColor, // Fondo blanco
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.homeFilledIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 0
                ? theme.primaryColor // Color azul cuando seleccionado
                : Colors.grey, // Gris cuando no seleccionado
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.searchIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 1
                ? theme.primaryColor // Color azul cuando seleccionado
                : Colors.grey, // Gris cuando no seleccionado
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.notifOutlinedIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 2
                ? theme.primaryColor // Color azul cuando seleccionado
                : Colors.grey, // Gris cuando no seleccionado
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.mailIcon,
            width: 24,
            height: 24,
            color: _selectedIndex == 3
                ? theme.primaryColor // Color azul cuando seleccionado
                : Colors.grey, // Gris cuando no seleccionado
          ),
          label: '',
        ),
      ],
    );
  }
}