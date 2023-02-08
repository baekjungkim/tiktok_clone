import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState == null) return;
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log in'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onSubmitTap,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Email',
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
                  validator: (value) {
                    if (value == null) return "Email not valid";
                    final regExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    return regExp.hasMatch(value) ? null : "Email not valid";
                  },
                  onSaved: (newValue) {
                    if (newValue == null) return;
                    formData['email'] = newValue;
                  },
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v16,
                TextFormField(
                  onEditingComplete: _onSubmitTap,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                  validator: (value) {
                    if (value == null) return 'Password not valid';
                    if (value.contains(RegExp(r"[a-z]"))) return null;
                    // if (value.contains(RegExp(r"[A-Z]"))) return null;
                    if (value.contains(RegExp(r"[0-9]"))) return null;
                    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return null;
                    }
                    return 'Password not valid';
                  },
                  onSaved: (newValue) {
                    if (newValue == null) return;
                    formData['password'] = newValue;
                  },
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    text: 'Log in',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
