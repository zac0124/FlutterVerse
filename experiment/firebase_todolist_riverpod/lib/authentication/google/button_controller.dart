import '../../repo/auth_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication_repository/auth_repo.dart';

final googleSignInProvider =
    StateNotifierProvider<GoogleSignInController, GoogleSignInState>(
  (ref) {
    final authenticationRepo = ref.watch(authRepoProvider);
    return GoogleSignInController(authenticationRepo);
  },
);

enum GoogleSignInState { initial, loading, success, error }

class GoogleSignInController extends StateNotifier<GoogleSignInState> {
  final AuthenticationRepository _authenticationRepository;

  GoogleSignInController(this._authenticationRepository)
      : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle() async {
    state = GoogleSignInState.loading;

    try {
      final isNewUser = await _authenticationRepository.signInWithGoogle();
      if (isNewUser != null && isNewUser) {}

      state = GoogleSignInState.success;
    } on SignInWithGoogleFailure catch (_) {
      state = GoogleSignInState.error;
    }
  }
}
