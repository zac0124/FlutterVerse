import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'authentication/auth_controller.dart';
import 'authentication/auth_view.dart';
import 'profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authProvider);

    Widget getHomePage() {
      if (authenticationState.status == AuthenticationStatus.authSuccess) {
        return const Profile();
      } else if (authenticationState.status ==
          AuthenticationStatus.authFailure) {
        return const AuthenticationView();
      } else {
        return const AuthenticationView();
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: getHomePage(),
    );
  }
}
