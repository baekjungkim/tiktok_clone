import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: const [
            Gaps.v40,
            Text(
              'What is your email',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            // TextField(
            //   controller: _emailController,
            //   keyboardType: TextInputType.emailAddress,
            //   onEditingComplete: _onSubmit,
            //   autocorrect: false,
            //   decoration: InputDecoration(
            //     hintText: 'Email',
            //     errorText: _isEmailValid(),
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.grey.shade400,
            //       ),
            //     ),
            //     focusedBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.grey.shade400,
            //       ),
            //     ),
            //   ),
            //   cursorColor: Theme.of(context).primaryColor,
            // ),
            // Gaps.v16,
            // GestureDetector(
            //   onTap: _onSubmit,
            //   child: FormButton(
            //       disabled: _email.isEmpty || _isEmailValid() != null),
            // ),
          ],
        ),
      ),
    );
  }
}
