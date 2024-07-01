import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_copycat/constants/assets_constants.dart';
import 'package:twitter_copycat/theme/pallete.dart';


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