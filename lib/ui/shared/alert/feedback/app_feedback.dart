import 'package:auto/ui/shared/colors.dart';
import 'package:auto/ui/shared/custom_widgets/stretch_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension AppFeedbacks on BuildContext {
  void showSnackBar(
    String msg, {
    bool floating = true,
    int duration = 4,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(msg),
        behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        duration: Duration(seconds: duration),
      ),
    );
  }

  Future<T?> showDialog<T>({
    String? titleText,
    String? confirmTitle,
    Widget? titleWidget,
    String? bodyText,
    Widget? bodyWidget,
    List<Widget>? actions,
    double? maxWidth,
    Color? confirmButtonBackgroundColor,
    Color? cancelButtonForegroundColor,
    bool warning = false,
    void Function()? onPressed,
  }) async {
    return showGeneralDialog<T?>(
      barrierDismissible: true,
      barrierLabel: '',
      context: Get.context!,
      transitionBuilder: (context, a1, a2, widget) {
        return Opacity(
          opacity: a1.value,
          child: AlertDialog(
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            title: titleWidget ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: IconButton.outlined(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        icon: const Center(child: Icon(Icons.close)),
                      ),
                    ),
                    Text(titleText!),
                    const SizedBox(width: 25),
                  ],
                ),
            content: bodyWidget ?? Text(bodyText!, textAlign: TextAlign.center),
            actions: actions ??
                [
                  StretchedButton(
                    backgroundColor: AppColors.purple3D0,
                    onPressed: onPressed,
                    child: const Text("Confirm"),
                  ),
                ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (BuildContext context, animation1, animation2) {
        return const SizedBox.shrink();
      },
    ).then<T?>((value) => value);
  }
}
