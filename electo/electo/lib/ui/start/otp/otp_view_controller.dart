import 'package:electo/app/services/authentication.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();

  submit(String email) async {
    await AuthenticationService().checkOtp(email, otpController.text);
  }
}
