import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/settings/view_models/mode_config_view_model.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_view_model.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.sm,
          ),
          child: ListView(
            children: [
              SwitchListTile.adaptive(
                value: ref.watch(modeConfigProvider).isDark,
                onChanged: (value) =>
                    ref.read(modeConfigProvider.notifier).setMode(value),
                title: const Text('Dark mode'),
                subtitle: const Text('App will be dark mode'),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).muted,
                onChanged: (value) =>
                    ref.read(playbackConfigProvider.notifier).setMuted(value),
                title: const Text('Mute video'),
                subtitle: const Text('Video will be muted by default.'),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).autoplay,
                onChanged: (value) => ref
                    .read(playbackConfigProvider.notifier)
                    .setAutoplay(value),
                title: const Text('Autoplay'),
                subtitle: const Text('Video will start playing automatically.'),
              ),
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text('Enable notifications'),
                subtitle: const Text('Enable notifications'),
              ),
              CheckboxListTile(
                activeColor: Colors.black,
                value: false,
                onChanged: (value) {},
                title: const Text('Enable notifications'),
              ),
              ListTile(
                onTap: () async {
                  // final date = await showDatePicker(
                  //   context: context,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime.now(),
                  //   lastDate: DateTime.now().add(
                  //     const Duration(
                  //       days: 7,
                  //     ),
                  //   ),
                  // );
                  // print(date);
                  // final time = await showTimePicker(
                  //   context: context,
                  //   initialTime: TimeOfDay.now(),
                  // );
                  // print(time);
                  final booking = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2090),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          appBarTheme: const AppBarTheme(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                        ),
                        child: child!,
                      );
                    },
                  );
                  print(booking);
                },
                title: const Text(
                  "What is your birthday?",
                ),
              ),
              ListTile(
                title: const Text("Log out (iOS)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please dont go"),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () {
                            ref.read(authRepository).signOut();
                            context.go('/');
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Log out (Android)"),
                textColor: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const FaIcon(
                        FontAwesomeIcons.skull,
                      ),
                      title: const Text("Are you sure?"),
                      content: const Text("Please dont go"),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(
                            FontAwesomeIcons.car,
                          ),
                        ),
                        TextButton(
                          child: const Text("Yes"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Log out (iOS / Bottom)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("Please dont go"),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text("Yes"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Log out (iOS / ActionSheet)"),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Are you sure?"),
                      message:
                          const Text("Please Doooooooooooooooooont gooooooooo"),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Not Log out'),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(' Log out'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const AboutListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
