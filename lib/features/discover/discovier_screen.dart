import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

const tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  String _keyword = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _keyword = _textEditingController.text;
      });
    });
  }

  void _onSubmitted() {
    if (_keyword != "") {
      print(_keyword);
    }
  }

  void _onClearTap() {
    _textEditingController.clear();
  }

  void _onSearchStop() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: TextField(
              controller: _textEditingController,
              onEditingComplete: _onSubmitted,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Input Keyword...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Sizes.size8,
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
                icon: GestureDetector(
                  onTap: _onSearchStop,
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: Sizes.size20,
                  ),
                ),
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size16,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (_keyword.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: Sizes.size10,
                        ),
                        child: GestureDetector(
                          onTap: _onClearTap,
                          child: const FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          bottom: TabBar(
            onTap: (value) {
              FocusScope.of(context).unfocus();
            },
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size6,
            ),
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              itemCount: 20,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size5,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 5 / 10.1,
              ),
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Sizes.size4,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 5 / 8,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/placeholder.jpg',
                            image:
                                'https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        '${constraints.maxWidth} This is a very long caption for my tiktok taht im uploading just now currently.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      Gaps.v5,
                      if (constraints.maxWidth < 200 ||
                          constraints.maxWidth > 250)
                        DefaultTextStyle(
                          style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey.shade300
                                : Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: Sizes.size12,
                                child: Text('baek'),
                              ),
                              Gaps.h4,
                              const Expanded(
                                child: Text(
                                  'My avatar is going to be very long',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gaps.h4,
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size16,
                                color: Colors.grey.shade500,
                              ),
                              Gaps.h2,
                              const Text(
                                '2.5M',
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
