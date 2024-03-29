import 'package:flutter/material.dart';
import './signin/sign_in.dart';
import './signup/sign_up.dart';
import '../components/auth_switch_button.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: _showSignIn ? const SignIn() : const SignUp(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: _showSignIn
                  ? const Text(
                      'Welcome back!',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    )
                  : const Text(
                      'create Account',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
            ),
          ),
          AuthSwitchButton(
              showSignIn: _showSignIn,
              onTap: () {
                setState(() {
                  _showSignIn = !_showSignIn;
                });
              })
        ],
      ),
    );
  }
}
