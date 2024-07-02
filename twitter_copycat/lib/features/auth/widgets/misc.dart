import 'package:flutter/material.dart';
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