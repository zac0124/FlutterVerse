import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../firebase_auth/lib/auth_repo.dart';
import 'package:authentication_repository/auth_repo.dart';

final authRepoProvider = Provider<AuthenticationRepository>(
  (_) => AuthenticationRepository(),
);
