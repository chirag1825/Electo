import 'package:electo/app/services/authentication.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  submit() async {
    await AuthenticationService().loginUser(emailController.text);
  }
}
