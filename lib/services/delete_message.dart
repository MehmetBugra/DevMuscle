import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle/pages/main/pages/chat/chatPage.dart';
import 'package:dev_muscle/variables/chat.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

Future<void> deleteMessage(BuildContext context, String id) async {
  String getID = id.replaceAll('"', "");
  CosmosFirebase.delete(
    'chat/"$getID"',
    () {
      messageList.value.clear();
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      messageList.notifyListeners();
      CosmosNavigator.pushNonAnimatedReplacement(
        context,
        const ChatPage(),
      );
    },
    (e) {
      Navigator.pop(context);
      CosmosAlert.showMessage(
        context,
        "Opps...",
        e.toString(),
        backgroundColor: navColor,
        color: textColor,
      );
    },
  );
}
