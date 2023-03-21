import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String routeName = 'chatDetail';
  static const String routeUrl = ':chatId';

  final String chatId;
  const ChatDetailScreen({super.key, required this.chatId});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  bool isWriting = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        isWriting = _textEditingController.text != '' ? true : false;
      });
    });
  }

  void _stopChats() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/44705388?v=4'),
                child: Text(
                  'baek',
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: Sizes.size20,
                  width: Sizes.size20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size4,
                    ),
                    color: Colors.greenAccent.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            'baek ${widget.chatId}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h20,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h16,
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _stopChats,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: isMine
                            ? Colors.blue
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size16,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size16,
                          ),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size16 : Sizes.size2,
                          ),
                          bottomRight: Radius.circular(
                            isMine ? Sizes.size2 : Sizes.size16,
                          ),
                        ),
                      ),
                      child: const Text(
                        "this is a messages!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size10,
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size44,
                          child: TextField(
                            controller: _textEditingController,
                            cursorColor: Theme.of(context).primaryColor,
                            textInputAction: TextInputAction.newline,
                            minLines: null,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Send a message...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size24,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size14,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  right: Sizes.size10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.grey.shade500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isWriting) Gaps.h14,
                      AnimatedOpacity(
                        opacity: isWriting ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: isWriting ? Sizes.size40 : 0,
                          width: isWriting ? Sizes.size40 : 0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.paperPlane,
                              size: Sizes.size20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
