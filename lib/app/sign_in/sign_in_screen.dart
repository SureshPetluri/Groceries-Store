import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';


class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final notifier = ref.read(signInProvider.notifier);

    return Scaffold(
      body: Form(
        key: notifier.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: notifier.userNameController,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Can't be empty";
                }
                return null;
              },
              onChanged: (value) => notifier.updateUserName(value),
            ),
            TextFormField(
              controller: notifier.passwordController,
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Can't be empty";
                }
                return null;
              },
              onChanged: (value) => notifier.updatePassword(value),
            ),
            ElevatedButton(
              onPressed: signInState.isValid
                  ? () {
                notifier.submitLogin(context);
              }
                  : null,
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
