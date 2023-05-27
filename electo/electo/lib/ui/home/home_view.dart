import 'package:electo/ui/profile/profile_view.dart';
import 'package:electo/ui/vote/vote_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController =
      Get.put(HomeController(), permanent: true);
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        builder: (s) => IndexedStack(
          index: s.selectedIndex,
          children: <Widget>[
            //  SafeArea(child: OrderView()),

            SafeArea(
              child: VoteView(
                user: s.user,
              ),
            ),
            SafeArea(child: ProfileView()),
          ],
        ),
      ),
      bottomNavigationBar: SuperFaBottomNavigationBar(profileUrl: ''),
    );
  }
}

class SuperFaBottomNavigationBar extends StatelessWidget {
  final String? profileUrl;
  const SuperFaBottomNavigationBar({
    Key? key,
    this.profileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ktheme = Theme.of(context);
    return GetX<HomeController>(
      // init only first time
      builder: (s) => CupertinoTabBar(
        activeColor: ktheme.primaryColor,
        inactiveColor: Colors.grey,
        iconSize: 25,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Vote',
            icon: Icon(
              Icons.inventory_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.verified_user,
            ),
          ),
        ],
        currentIndex: Get.find<HomeController>().selectedIndex,
        onTap: Get.find<HomeController>().onItemTapped,
        /* currentIndex: Get.find<ProfileController>().selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: Get.find<ProfileController>().onItemTapped, */
      ),
    );
  }
}
