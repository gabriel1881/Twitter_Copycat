import 'package:flutter/material.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/features/auth/controller/user_data_handler.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class CreateTweetView extends StatelessWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController tweetTextController = TextEditingController();

    void saveTweet() async {
      String tweetText = tweetTextController.text;
      String userId = userData.username ?? 'default_user_id';
      /*if (userId.isEmpty) {
        print('Error: User ID is null or empty');
        return;
      }

      print('User ID: $userId');*/
      await createTweet(userId, tweetText);
      print('Tweet guardado: $tweetText');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: saveTweet,
              style: ElevatedButton.styleFrom(
                foregroundColor: Pallete.whiteColor,
                backgroundColor: Pallete.blueColor,
              ),
              child: const Text('Tweet'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: tweetTextController,
                decoration: InputDecoration(
                  hintText: "What's happening?",
                  hintStyle: TextStyle(
                    color: Pallete.greyColor,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                ),
                maxLines: null,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}