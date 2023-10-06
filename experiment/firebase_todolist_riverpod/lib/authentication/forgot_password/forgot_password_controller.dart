import 'package:firebase_todolist_riverpod/firebase_auth/lib/auth_repo.dart';
import '../../repo/auth_repo_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_todolist_riverpod/form_validator/lib/form_validators.dart';

part 'forgot_password_state.dart';

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
        ForgotPasswordController, ForgotPasswordState>(
    ((ref) => ForgotPasswordController(
          ref.watch(authRepoProvider),
        )));

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);
    state = state.copywith(
      email: email,
      status: Formz.validate([email]),
    );
  }

  Future<void> forgotPassword() async {
    if (!state.status.isValidated) return;
    state = state.copywith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.forgotPassword(email: state.email.value);
      state = state.copywith(status: FormzStatus.submissionSuccess);
    } on ForgotPasswordFailure catch (e) {
      state = state.copywith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}
