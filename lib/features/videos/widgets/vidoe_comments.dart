import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text('2285 comments'),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          separatorBuilder: (context, index) => Gaps.v20,
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: Sizes.size20,
                child: Text('baek'),
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'baek',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade500),
                    ),
                    Gaps.v3,
                    const Text(
                        "That's not it l've seen the save thing but also in a cave"),
                  ],
                ),
              ),
              Gaps.h10,
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.heart,
                    size: Sizes.size20,
                    color: Colors.grey.shade500,
                  ),
                  Gaps.v5,
                  Text(
                    '52.5K',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: const [
              CircleAvatar(
                radius: Sizes.size20,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                foregroundImage: NetworkImage(
                    'https://imagedelivery.net/-4c3-zEb4Op0_1qjNCTcBg/83d21280-3efd-4f64-1e5b-deaf86e0d900/avatar'),
                child: Text('vgan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
