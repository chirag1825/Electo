import 'package:electo/app/model/user.dart';
import 'package:electo/app/services/authentication.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  final _selectedIndex = 0.obs;
  set selectedIndex(value) => this._selectedIndex.value = value;
  get selectedIndex => this._selectedIndex.value;
  onItemTapped(int index) {
    this._selectedIndex.value =
        index; // The set method is accessed this way, you have confused it with methods.
  }
}
