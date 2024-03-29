import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../google/button_controller.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<GoogleSignInState>(googleSignInProvider, (previous, current) {
      if (current == GoogleSignInState.loading) {
        showDialog(
          context: context,
          builder: (_) => const SimpleDialog(
            title: Padding(
              padding: EdgeInsets.all(32.0),
              child: Text('loading'),
            ),
          ),
        );
      } else if (current == GoogleSignInState.error) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('google signin failed'),
          ),
        );
      } else {
        Navigator.of(context).pop();
      }
    });

    return TextButton(
      onPressed: () {
        ref.read(googleSignInProvider.notifier).signInWithGoogle();
      },
      child: const Text(
        'Sign in with google',
        style: TextStyle(
          color: Color(0xFF9A9A9A),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
