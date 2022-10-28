import 'package:firebase_todolist/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_todolist/models/user_models.dart';
import 'package:firebase_todolist/ui/components/components.dart';
import 'package:firebase_todolist/helpers/helpers.dart';
import 'package:firebase_todolist/ui/auth/auth.dart';

class UpdateProfileUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    authController.nameController.text =
        authController.firestoreUser.value!.name;
    authController.emailController.text =
        authController.firestoreUser.value!.email;
    return Scaffold(
      appBar: AppBar(title: Text('auth.updateProfileTitle'.tr)),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LogoGraphicHeader(),
                  SizedBox(height: 48.0),
                  FormInputFieldWithIcon(
                      controller: authController.nameController,
                      iconPrefix: Icons.person,
                      labelText: 'auth.nameFormField'.tr,
                      validator: Validator().name,
                      //onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.nameController.text = value!),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                      controller: authController.emailController,
                      iconPrefix: Icons.email,
                      labelText: 'auth.emailFormField'.tr,
                      validator: Validator().email,
                      //onChanged: (value) => null,
                      onSaved: (value) =>
                          authController.emailController.text = value!),
                  FormVerticalSpace(),
                  PrimaryButton(
                    labelText: 'auth.updateUser'.tr,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        UserModel _updatedUser = UserModel(
                          uid: authController.firestoreUser.value!.uid,
                          email: authController.firestoreUser.value!.email,
                          name: authController.firestoreUser.value!.name,
                          photoUrl:
                              authController.firestoreUser.value!.photoUrl,
                        );
                        _updateUserConfirm(context, _updatedUser,
                            authController.firestoreUser.value!.email);
                      }
                    },
                  ),
                  FormVerticalSpace(),
                  LabelButton(
                    labelText: 'auth.resetPasswordLabelButton'.tr,
                    onPressed: (() => Get.to(() => resetPasswordUI())),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateUserConfirm(
      BuildContext context, UserModel updatedUser, String oldEmail) async {
    final AuthController authController = AuthController.to;
    final TextEditingController _password = new TextEditingController();
    return Get.dialog(AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      title: Text('auth.enterPassword'.tr),
      content: FormInputFieldWithIcon(
        controller: _password,
        iconPrefix: Icons.lock,
        labelText: 'auth.passwordFormField'.tr,
        validator: (value) {
          String pattern = r'^.{6,}$';
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value!)) {
            return 'validator.password'.tr;
          } else {
            return null.toString();
          }
        },
        obscureText: true,
        //onChanged: (value) => null,
        onSaved: (value) => _password.text = value!,
        maxLines: 1,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
          },
          child: Text('auth.cancel'.tr.toUpperCase()),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await authController.updateUser(
                context, updatedUser, oldEmail, _password.text);
          },
          child: Text('auth.submit'.tr.toUpperCase()),
        )
      ],
    ));
  }
}
