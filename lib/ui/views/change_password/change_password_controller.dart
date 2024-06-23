import 'package:auto/core/data/models/apis/password_model.dart';
import 'package:auto/core/data/network/api_service.dart';
import 'package:auto/core/data/repositories/user_repository.dart';
import 'package:auto/core/enums/message_type.dart';
import 'package:auto/ui/shared/alert/errors/app_error_feedback.dart';
import 'package:auto/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool hiddenCurrentPass = true.obs;
  RxBool hiddenNewPass = true.obs;
  RxBool hiddenConfirmPass = true.obs;

   void replaceCurrentPass() {
    hiddenCurrentPass.isTrue ? hiddenCurrentPass.value = false : hiddenCurrentPass.value = true;
  }

  void replaceNewPass() {
    hiddenNewPass.isTrue ? hiddenNewPass.value = false : hiddenNewPass.value = true;
  }

  void replaceConfirmPass() {
    hiddenConfirmPass.isTrue ? hiddenConfirmPass.value = false : hiddenConfirmPass.value = true;
  }



  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void changePassword() {
    if (formKey.currentState!.validate()) {
      ApiFutureBuilder<PassordModel>().fetch(
        Get.context!,
        future: () async {
          final changePass = UserRepository().changePassword(
            currentPassword: currentPasswordController.text.trim(),
            newPassword: newPasswordController.text.trim(),
            confirmPassword: confirmPasswordController.text.trim(),
          );
          return changePass;
        },
        onComplete: (snapshot) {
          if (snapshot.success == true) {
            CustomToast.showMessage(message:snapshot.message! ,messageType: MessageType.succsess);
            Get.back();
          } else if(snapshot.success == false) {
            CustomToast.showMessage(message: snapshot.data![0].password!,messageType: MessageType.rejected);
          }
        },
        onError: (failure) => AppErrorFeedback.show(failure),
      );
    }
  }

}