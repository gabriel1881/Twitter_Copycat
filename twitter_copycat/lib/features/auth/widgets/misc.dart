import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/features/auth/controller/auth.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class Space extends StatelessWidget {
  final double height;
  const Space({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
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

class TweetWidget extends StatelessWidget {
  final String userName;
  final String date;
  final String body;

  const TweetWidget({
    super.key,
    required this.userName,
    required this.date,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedDate = date.length > 10 ? date.substring(0, 10) : date;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Image
          SvgPicture.asset(
            AssetsConstants.userIcon,
            width: 40,
            height: 40,
            color: Pallete.greyColor,
          ),
          const SizedBox(width: 10),
          // Tweet Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Name and Date with Three Dots Icon
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            truncatedDate,
                            style: const TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      AssetsConstants.threeDotsIcon,
                      width: 12,
                      height: 12,
                      color: Pallete.greyColor,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Tweet Body
                Text(
                  body,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                // Tweet Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AssetsConstants.commentIcon,
                      width: 20,
                      height: 20,
                      color: Pallete.greyColor,
                    ),
                    SvgPicture.asset(
                      AssetsConstants.retweetIcon,
                      width: 20,
                      height: 20,
                      color: Pallete.greyColor,
                    ),
                    SvgPicture.asset(
                      AssetsConstants.likeOutlinedIcon,
                      width: 20,
                      height: 20,
                      color: Pallete.greyColor,
                    ),
                    SvgPicture.asset(
                      AssetsConstants.uploadIcon,
                      width: 16,
                      height: 16,
                      color: Pallete.greyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TweetsList extends StatefulWidget {
  const TweetsList({Key? key}) : super(key: key);

  @override
  _TweetsListState createState() => _TweetsListState();
}

class _TweetsListState extends State<TweetsList> {
  late Stream<List<Document>> _tweetsStream;

  @override
  void initState() {
    super.initState();
    _tweetsStream = pollTweets();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Document>>(
      stream: _tweetsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No tweets found.'));
        } else {
          List<Document> tweets = snapshot.data!;
          return ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              var tweet = tweets[index];
              String userName = tweet.data['user'] ?? 'Unknown User';
              String date = tweet.data['date'] ?? 'Unknown Date';
              String body = tweet.data['body'] ?? '';
              return TweetWidget(
                userName: userName,
                date: date,
                body: body,
              );
            },
          );
        }
      },
    );
  }
}