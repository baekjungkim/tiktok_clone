import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};
  bool _isValid = true;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onHideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _onProfileUpdatePressed() {
    if (_formKey.currentState == null) return;
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    ref.read(usersProvider.notifier).updateProfile(
          context,
          name: formData['name']!,
          link: formData['link'] ?? '',
          bio: formData['bio'] ?? '',
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
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
          title: const Text("Profile Update"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _onHideKeyboard,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: Sizes.size32,
              left: Sizes.size16,
              right: Sizes.size16,
              bottom: Sizes.size96 + Sizes.size20,
            ),
            child: Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _isValid = _formKey.currentState!.validate();
                });
              },
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NAME'),
                  Gaps.v10,
                  TextFormField(
                    autocorrect: false,
                    initialValue: ref.watch(usersProvider).value?.name,
                    decoration: InputDecoration(
                      hintText: 'Update NAME',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 4 ||
                          value.length > 11) {
                        return " (Name is more than 3 digits and less than 10 digits.)";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      formData['name'] = newValue;
                    },
                  ),
                  Gaps.v32,
                  const Text('LINK'),
                  Gaps.v10,
                  TextFormField(
                    autocorrect: false,
                    initialValue: ref.watch(usersProvider).value?.link,
                    decoration: InputDecoration(
                      hintText: 'Update LINK',
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      formData['link'] = newValue;
                    },
                  ),
                  Gaps.v32,
                  const Text('BIO'),
                  Gaps.v10,
                  TextFormField(
                    autocorrect: false,
                    initialValue: ref.watch(usersProvider).value?.bio,
                    minLines: 3,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Update BIO',
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    onSaved: (newValue) {
                      if (newValue == null) return;
                      formData['bio'] = newValue;
                    },
                  ),
                  Gaps.v32,
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: GestureDetector(
              onTap: _onProfileUpdatePressed,
              child: FormButton(
                disabled: !_isValid,
                text: 'Profile Update',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
