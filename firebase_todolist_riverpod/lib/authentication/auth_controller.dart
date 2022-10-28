import 'dart:async';

import 'package:authentication_repository/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repo/auth_repo_provider.dart';

part 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthenticationState>(
  (ref) => AuthController(ref.watch(authRepoProvider)),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authRepo;
  late final StreamSubscription _streamSubscription;

  AuthController(this._authRepo)
      : super(const AuthenticationState.authFailure()) {
    _streamSubscription = _authRepo.user.listen((user) => _onUserChanged(user));
  }
  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.authFailure();
    } else {
      state = AuthenticationState.authSuccess(user);
    }
  }

  void onSignOut() {
    _authRepo.signOut();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
