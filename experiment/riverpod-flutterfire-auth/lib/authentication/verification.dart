import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../authentication/controller/authentication_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../profile/profile.dart';

class Verification extends ConsumerWidget {
  const Verification({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUser = ref.watch(authProvider).user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("user id: ${authUser.id}"),
            Text("user email: ${authUser.email}"),
            Text("email verified: ${authUser.emailVerified}"),
            TextButton(
              child: const Text("Verify Email"),
              onPressed: () async {
                if (!authUser.emailVerified) {
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification();
                  if (authUser.emailVerified) {
                    const Profile();
                  }
                  Text("email not verified: ${authUser.emailVerified}");
                  print('Error 1');
                }
                Text("email error verified: ${authUser.emailVerified}");
                print('Error 2');
              },
            ),
          ],
        ),
      ),
    );
  }
}
