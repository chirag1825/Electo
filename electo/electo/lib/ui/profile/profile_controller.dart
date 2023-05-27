import 'package:electo/app/api/api.dart';
import 'package:electo/app/model/party.dart';
import 'package:electo/app/services/authentication.dart';

import 'package:electo/constants/const.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  var user;

  initialize() async {
    var id = await AuthenticationService.userIdInApp;
    print(id);
    user = await AuthenticationService().getProfile(id);
    print(user.email);
  }
}
