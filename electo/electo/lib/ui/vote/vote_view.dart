import 'package:electo/app/model/party.dart';
import 'package:electo/app/model/user.dart';
import 'package:electo/dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'vote_controller.dart';

class VoteView extends StatelessWidget {
  final String? email;
  final User? user;
  VoteView({Key? key, this.email, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoteController>(
      init: VoteController(),
      builder: (s) => ListView.builder(
        itemCount: s.parties.length,
        itemBuilder: (BuildContext context, int index) {
          return VoteCard(party: s.parties[index], index: index, user: user);
        },
      ),
    );
  }
}

class VoteCard extends StatelessWidget {
  final int? index;
  final Party? party;
  final User? user;
  const VoteCard({Key? key, this.party, this.user, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await alertDialog(
            'Congratulation You have voted to ${party!.name.toString()}',
            color: Colors.lightGreen);
      },
      tileColor: user!.vote! < 1
          ? user!.vote == index
              ? Colors.green
              : Colors.red
          : Colors.grey,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(party!.photoUrl.toString()),
      ),
      title: Text(party!.name.toString()),
      subtitle: Text(party!.slogan.toString()),
    );
  }
}
