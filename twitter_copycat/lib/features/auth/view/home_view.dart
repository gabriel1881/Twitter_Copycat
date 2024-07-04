import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/features/auth/widgets/bars.dart';
import 'package:twitter_copycat/features/auth/widgets/buttons.dart';
import 'package:twitter_copycat/features/auth/widgets/misc.dart';
import 'package:twitter_copycat/theme/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAndSetUserData();
  }

  Future<void> fetchAndSetUserData() async {
    User? user = await getUser();
    if (user != null) {
      setState(() {
        userData.name = user.name;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: LightTheme.theme, 
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, 
          title: const HomeTwitterHeader(), 
        ),
        body: isLoading 
          ? const Center(child: CircularProgressIndicator())
          : const Stack(
            children: [
                  Column(
                    children: [
                      StoriesHeader(),
                      Expanded(
                        child: Center(
                          child: TweetsList(),
                        ),
                      ),
                    ],
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