import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/buttons.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/theme/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightTheme.theme, 
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, 
          title: const HomeTwitterHeader(), 
        ),
        body: const Stack(
          children: [
            Center(
              child: TweetsList(),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FeatherButton(), 
            ),
          ],
        ),
        bottomNavigationBar: const HomeNavBar(), 
      ),
    );
  }
}