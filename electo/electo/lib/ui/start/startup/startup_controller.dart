import 'package:electo/app/services/authentication.dart';
import 'package:electo/ui/home/home_view.dart';
import 'package:electo/ui/start/login/login_view.dart';
import 'package:get/get.dart';

class StartupController extends GetxController {
  @override
  void onInit() {
    checkUser();
    super.onInit();
  }

  checkUser() async {
    bool exist = await AuthenticationService().userExistsInApp();
    if (exist) {
      print(await AuthenticationService.userIdInApp);
      await Get.off(() => HomeView());
      print("hii1");
    } else {
      await Get.off(() => LoginView());
    }
  }
}
