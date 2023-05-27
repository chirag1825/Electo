import 'package:electo/app/api/api.dart';
import 'package:electo/app/model/party.dart';

import 'package:electo/constants/const.dart';

import 'package:get/get.dart';

class VoteController extends GetxController {
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  List<Party> parties = [];
  initialize() async {
    var res = await RestApi.getData(query: party);
    parties = partyFromJson(res);
    update();
  }
}
