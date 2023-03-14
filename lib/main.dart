import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TiktokApp());
}

class TiktokApp extends StatefulWidget {
  const TiktokApp({super.key});

  @override
  State<TiktokApp> createState() => _TiktokAppState();
}

class _TiktokAppState extends State<TiktokApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticktok Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: Typography.blackHelsinki,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        primaryColor: const Color(0xffe9435a),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435a),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey.shade500,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade200,
          iconColor: Colors.grey.shade600,
          prefixIconColor: Colors.grey.shade600,
          suffixIconColor: Colors.grey.shade600,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteHelsinki,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xffe9435a),
        ),
        primaryColor: const Color(0xffe9435a),
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade800,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          iconColor: Colors.grey.shade500,
          prefixIconColor: Colors.grey.shade500,
          suffixIconColor: Colors.grey.shade500,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
