import 'package:electo/app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (s) => ListView(
        children: [
          Text(s.user.email),
          Text(s.user.vote > 0 ? 'User has Voted ' : 'User not Voted'),
        ],
      ),
    );
  }
}
