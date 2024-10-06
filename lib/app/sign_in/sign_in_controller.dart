import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_store/app/sign_in/sign_in_state.dart';

import '../community_blog/community_blog_screen.dart';


class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void updateUserName(String value) {
    state = state.copyWith(userName: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void submitLogin(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      print('Username: ${state.userName}');
      print('Password: ${state.password}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CommunityFeedScreen()));
    }
  }
}
