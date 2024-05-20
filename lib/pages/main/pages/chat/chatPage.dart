import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle/services/get_chat.dart';
import 'package:dev_muscle/services/select_img.dart';
import 'package:dev_muscle/services/send_message.dart';
import 'package:dev_muscle/variables/chat.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _HomePageState();
}

class _HomePageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    getChatFun(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ValueListenableBuilder(
          valueListenable: messageList,
          builder: (context, value, child) {
            return CosmosBody(
              scrollable: true,
              scrollDirection: Axis.vertical,
              children: value,
            );
          },
        )),
        Container(
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: width(context),
          decoration: BoxDecoration(
            color: cColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: chatMessageController,
                  cursorColor: defaultColor,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Mesaj yaz...",
                    hintStyle: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    if (chatMessageController.text.length > 1) {
                      sendMessageBtnVisible.value = true;
                    } else {
                      sendMessageBtnVisible.value = false;
                    }
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: sendMessageBtnVisible,
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () async {
                      if (value == true) {
                        await sendMessage(context);
                      }
                    },
                    child: Opacity(
                      opacity: value == true ? 1 : 0.5,
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  selectImage(context);
                },
                child: const Icon(
                  Icons.attach_file,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}
