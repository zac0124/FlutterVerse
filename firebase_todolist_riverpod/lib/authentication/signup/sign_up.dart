import './sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/text_input_field.dart';
import 'package:firebase_todolist_riverpod/form_validator/lib/form_validators.dart';

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(
      signUpProvider,
      ((previous, current) {
        if (current.status.isSubmissionInProgress) {
          showDialog(
              context: context,
              builder: (_) => const SimpleDialog(
                    title: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text('loading...'),
                    ),
                  ));
        } else if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${current.errorMessage}'),
            ),
          );
        } else if (current.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        }
      }),
    );

    return Column(
      children: [
        NameField(),
      ],
    );
  }
}

class NameField extends ConsumerWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final showError = signUpState.name.invalid;

    return TextInputField(
      hintText: 'Name',
      onChanged: (name) => signUpController.onNameChange(name),
      errorText:
          showError ? Name.showNameErrorMessage(signUpState.name.error) : null,
    );
  }
}

class PasswordField extends ConsumerWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final errorMessage = signUpState.password.invalid;

    return TextInputField(
        hintText: 'Password',
        obscureText: true,
        onChanged: (password) => signUpController.onPasswordChange(password),
        errorText: errorMessage
            ? Password.showPasswordErrorMessage(signUpState.password.error)
            : null);
  }
}

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final errorMessage = signUpState.email.invalid;

    return TextInputField(
        hintText: 'Email',
        onChanged: (email) => signUpController.onEmailChange(email),
        errorText: errorMessage
            ? Email.showEmailErrorMessage(signUpState.email.error)
            : null);
  }
}

class SignUpButton extends ConsumerWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = signUpState.status.isValidated;
    return ElevatedButton(
      onPressed: isValidated
          ? () => signUpController.signUpWithEmailAndPassword()
          : null,
      child: const Text('Sign Up'),
    );
  }
}
