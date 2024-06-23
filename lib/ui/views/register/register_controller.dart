import 'package:auto/core/data/models/apis/auth_model.dart';
import 'package:auto/core/data/network/api_service.dart';
import 'package:auto/core/data/repositories/user_repository.dart';
import 'package:auto/core/enums/message_type.dart';
import 'package:auto/core/utils/general_util.dart';
import 'package:auto/ui/shared/alert/errors/app_error_feedback.dart';
import 'package:auto/ui/shared/custom_widgets/custom_toast.dart';
import 'package:auto/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString countryCode="".obs;
  RxBool hiddenPass = true.obs;
  RxBool hiddenConfirmPass = true.obs;

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }

  void replacePass() {
    hiddenPass.isTrue ? hiddenPass.value = false : hiddenPass.value = true;
  }

  void replaceConfirmPass() {
    hiddenConfirmPass.isTrue ? hiddenConfirmPass.value = false : hiddenConfirmPass.value = true;
  }

  void register() {
    if (formKey.currentState!.validate()) {
      ApiFutureBuilder<AuthModel>().fetch(
        Get.context!,
        future: () async {
          final register = UserRepository().creatAccount(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim(),
            password: passwordController.text.trim(),
            countryCode: countryCode.value,
            confirmPassword: confirmPassController.text.trim(),
          );
          return register;
        },
        onComplete: (snapshot) {
          if (snapshot.success == true) {
            CustomToast.showMessage(message: snapshot.message!,messageType: MessageType.succsess);
            storage.setTokenInfo(snapshot.data!.token!);
            storage.setFirstLanuch(false);
            storage.setUser(snapshot.data!);
            Get.offAll(()=> const HomeView());
          } else if(snapshot.success == false) {
            CustomToast.showMessage(message: snapshot.message!,messageType: MessageType.rejected);
          }
        },
        onError: (failure) => AppErrorFeedback.show(failure),
      );
    }
  }
}
