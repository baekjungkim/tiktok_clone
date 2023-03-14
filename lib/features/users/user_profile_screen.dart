import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/user_follow_block.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return size.width < Breakpoints.md
                  ? [
                      SliverAppBar(
                        title: const Text('Baek'),
                        actions: [
                          IconButton(
                            onPressed: _onGearPressed,
                            icon: const FaIcon(
                              FontAwesomeIcons.gear,
                              size: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Gaps.v20,
                            const CircleAvatar(
                              radius: 50,
                              foregroundImage: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/44705388?v=4'),
                              child: Text("Baek"),
                            ),
                            Gaps.v20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '@Baek',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.h5,
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: Sizes.size16,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            Gaps.v24,
                            SizedBox(
                              height: Sizes.size52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const UserFollowBlock(
                                    count: '97',
                                    title: 'Following',
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade400,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  const UserFollowBlock(
                                    count: '10.5M',
                                    title: 'Followers',
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade400,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  const UserFollowBlock(
                                    count: '149.3M',
                                    title: 'Likes',
                                  ),
                                ],
                              ),
                            ),
                            Gaps.v14,
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: Breakpoints.sm,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.h10,
                                  Flexible(
                                    child: FractionallySizedBox(
                                      widthFactor: 0.5,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                          border: Border.all(
                                            width: 0.3,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.youtube,
                                            size: Sizes.size18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.h10,
                                  Flexible(
                                    child: FractionallySizedBox(
                                      widthFactor: 0.5,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                          border: Border.all(
                                            width: 0.3,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.caretDown,
                                            size: Sizes.size18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gaps.v14,
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.size32,
                              ),
                              child: Text(
                                'All highlights and where to watch live matches on FIFA+ I wonder how it would looks',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.v14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  "https://nomadcorder.co",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v20,
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                          pinned: true, delegate: PersistentTabBar()),
                    ]
                  : [
                      SliverToBoxAdapter(
                        child: Container(
                          width: size.width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 50,
                                foregroundImage: NetworkImage(
                                    'https://avatars.githubusercontent.com/u/44705388?v=4'),
                                child: Text("Baek"),
                              ),
                              Gaps.h20,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        '@Baek',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Sizes.size18,
                                        ),
                                      ),
                                      Gaps.h20,
                                      Row(
                                        children: [
                                          Container(
                                            width: Sizes.size72,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: Sizes.size12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  Sizes.size4,
                                                ),
                                              ),
                                            ),
                                            child: const Text(
                                              "Follow",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Gaps.h10,
                                          Container(
                                            width: Sizes.size48,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: Sizes.size12,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  Sizes.size4,
                                                ),
                                              ),
                                              border: Border.all(
                                                width: 0.3,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            child: const Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.youtube,
                                                size: Sizes.size18,
                                              ),
                                            ),
                                          ),
                                          Gaps.h10,
                                          Container(
                                            width: Sizes.size48,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: Sizes.size12,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(
                                                  Sizes.size4,
                                                ),
                                              ),
                                              border: Border.all(
                                                width: 0.3,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            child: const Center(
                                              child: FaIcon(
                                                FontAwesomeIcons.caretDown,
                                                size: Sizes.size18,
                                              ),
                                            ),
                                          ),
                                          Gaps.h10,
                                          IconButton(
                                            onPressed: _onGearPressed,
                                            icon: const FaIcon(
                                              FontAwesomeIcons.gear,
                                              size: Sizes.size20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gaps.v10,
                                  SizedBox(
                                    height: Sizes.size48,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const UserFollowBlock(
                                          count: '97',
                                          title: 'Following',
                                        ),
                                        VerticalDivider(
                                          width: Sizes.size52,
                                          thickness: Sizes.size1,
                                          color: Colors.grey.shade400,
                                          indent: Sizes.size14,
                                          endIndent: Sizes.size14,
                                        ),
                                        const UserFollowBlock(
                                          count: '10.5M',
                                          title: 'Followers',
                                        ),
                                        VerticalDivider(
                                          width: Sizes.size52,
                                          thickness: Sizes.size1,
                                          color: Colors.grey.shade400,
                                          indent: Sizes.size14,
                                          endIndent: Sizes.size14,
                                        ),
                                        const UserFollowBlock(
                                          count: '149.3M',
                                          title: 'Likes',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gaps.v10,
                                  const SizedBox(
                                    width: 500,
                                    child: Text(
                                      'All highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looksAll highlights and where to watch live matches on FIFA+ I wonder how it would looks',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: PersistentTabBar(),
                      ),
                    ];
            },
            body: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.sm,
              ),
              child: TabBarView(
                children: [
                  Center(
                    child: GridView.builder(
                      itemCount: 20,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width > Breakpoints.lg ? 5 : 2,
                        crossAxisSpacing: Sizes.size2,
                        mainAxisSpacing: Sizes.size2,
                        childAspectRatio: 9 / 14,
                      ),
                      itemBuilder: (context, index) {
                        var randomDouble = (Random().nextDouble() * 100);
                        return LayoutBuilder(
                          builder: (context, constraints) => Column(
                            children: [
                              Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 9 / 14,
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/images/placeholder.jpg',
                                      image:
                                          'https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: Sizes.size5,
                                    bottom: Sizes.size2,
                                    child: Row(
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.play,
                                          color: Colors.white,
                                          size: Sizes.size14,
                                        ),
                                        Gaps.h6,
                                        Text(
                                          '${randomDouble.toStringAsFixed(1)} ${(randomDouble.floor()) % 2 == 1 ? "K" : "M"}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Center(
                    child: Text("page two"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
