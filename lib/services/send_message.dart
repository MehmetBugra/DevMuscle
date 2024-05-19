import 'package:cosmos/cosmos.dart';
import 'package:fitness_clup/variables/chat.dart';
import 'package:fitness_clup/variables/colors.dart';
import 'package:flutter/material.dart';

Future<void> sendMessage(
  BuildContext context,
) async {
  String tag = CosmosRandom.randomTag();
  String uid = await CosmosFirebase.getUID();
  await CosmosFirebase.add(
    reference: "chat",
    tag: tag,
    value: [
      uid,
      tag,
      chatMessageController.text,
      CosmosTime.getNowTimeString(),
      "message",
    ],
    onError: (e) {
      CosmosAlert.showMessage(
        context,
        "Opps...",
        e.toString(),
        backgroundColor: navColor,
        color: textColor,
      );
    },
    onSuccess: () {
      sendMessageBtnVisible.value = false;
      chatMessageController.clear();
    },
  );
}
