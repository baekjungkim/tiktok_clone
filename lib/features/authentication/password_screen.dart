import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/view_models/signup_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLengthValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  bool _isPasswordRegExpValid() {
    if (!_password.contains(RegExp(r"[a-z]"))) return false;
    // if (!_password.contains(RegExp(r"[A-Z]"))) return false;
    if (!_password.contains(RegExp(r"[0-9]"))) return false;
    if (!_password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordLengthValid() || !_isPasswordRegExpValid()) return;
    final state = ref.read(signupForm.notifier).state;
    ref.read(signupForm.notifier).state = {
      ...state,
      "password": _password,
    };
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h14,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: _obscureText
                              ? Sizes.size20
                              : Sizes.size16 + Sizes.size2,
                        ),
                      ),
                    ],
                  ),
                  hintText: 'Make it strong!',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    !_isPasswordLengthValid()
                        ? FontAwesomeIcons.circleXmark
                        : FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: !_isPasswordLengthValid()
                        ? Theme.of(context).primaryColor
                        : Colors.green,
                  ),
                  Gaps.h8,
                  Text(
                    '8 to 20 characters',
                    style: TextStyle(
                      color: !_isPasswordLengthValid()
                          ? Theme.of(context).primaryColor
                          : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gaps.v5,
              Row(
                children: [
                  FaIcon(
                    !_isPasswordRegExpValid()
                        ? FontAwesomeIcons.circleXmark
                        : FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: !_isPasswordRegExpValid()
                        ? Theme.of(context).primaryColor
                        : Colors.green,
                  ),
                  Gaps.h8,
                  Text(
                    'Letters, numbers, and special chracters',
                    style: TextStyle(
                      color: !_isPasswordRegExpValid()
                          ? Theme.of(context).primaryColor
                          : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled:
                      !_isPasswordLengthValid() || !_isPasswordRegExpValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
