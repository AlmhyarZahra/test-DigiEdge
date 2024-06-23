import 'package:auto/core/enums/message_type.dart';
import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/utils.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static showMessage({
    required String message,
    MessageType messageType = MessageType.info,
  }) {
    Color color = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.info:
        color = AppColors.mainBlueColor;
        break;
      case MessageType.warning:
        color = AppColors.mainOrangeColor;
        break;
      case MessageType.rejected:
        color = AppColors.mainRedColor;
        break;
      case MessageType.succsess:
        color = AppColors.mainColorGreen;
        break;
    }
    BotToast.showCustomText(
      duration: const Duration(seconds: 3),
      toastBuilder: (value) {
        return Container(
          width: double.infinity,
          height: screenWidth(5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageType == MessageType.succsess ? "Success" : "Error",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:  TextStyle(
                  color: Colors.grey[300],
                  fontSize: screenWidth(30),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
