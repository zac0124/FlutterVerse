part of 'auth_controller.dart';

enum AuthenticationStatus {
  authSuccess,
  authFailure,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthUser user;

  const AuthenticationState._({
    required this.status,
    this.user = AuthUser.empty,
  });

  const AuthenticationState.authSuccess(AuthUser user)
      : this._(status: AuthenticationStatus.authSuccess, user: user);

  const AuthenticationState.authFailure()
      : this._(status: AuthenticationStatus.authFailure);

  @override
  List<Object> get props => [user, status];
}
