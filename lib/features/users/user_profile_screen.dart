import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/views/settings_screen.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/avatar.dart';
import 'package:tiktok_clone/features/users/widgets/update_profile.dart';
import 'package:tiktok_clone/features/users/widgets/user_follow_block.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String username;
  final String tab;
  const UserProfileScreen({
    super.key,
    required this.username,
    this.tab = 'posts',
  });

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  void _onProfileUpdatePressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const UpdateProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) {
            return Scaffold(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              body: SafeArea(
                child: DefaultTabController(
                  initialIndex: widget.tab == 'likes' ? 1 : 0,
                  length: 2,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          title: Text(data.name),
                          actions: [
                            IconButton(
                              onPressed: _onProfileUpdatePressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.screwdriverWrench,
                                size: Sizes.size20,
                              ),
                            ),
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
                              Avatar(
                                uid: data.uid,
                                name: data.name,
                                hasAvatar: data.hasAvatar,
                              ),
                              Gaps.v20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '@${data.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                  Gaps.h5,
                                  const FaIcon(
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
                                            color:
                                                Theme.of(context).primaryColor,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size32,
                                ),
                                child: Text(
                                  ref.watch(usersProvider).value?.bio ?? '',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gaps.v14,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    ref.watch(usersProvider).value?.link ?? '',
                                    style: const TextStyle(
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    size.width > Breakpoints.lg ? 5 : 2,
                                crossAxisSpacing: Sizes.size2,
                                mainAxisSpacing: Sizes.size2,
                                childAspectRatio: 9 / 14,
                              ),
                              itemBuilder: (context, index) {
                                var randomDouble =
                                    (Random().nextDouble() * 100);
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
          },
        );
  }
}
