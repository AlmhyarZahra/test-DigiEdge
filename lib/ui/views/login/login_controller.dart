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

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool hiddenPass = true.obs;
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  void replacePass() {
    hiddenPass.isTrue ? hiddenPass.value = false : hiddenPass.value = true;
  }

   void login() {
    if (formKey.currentState!.validate()) {
      ApiFutureBuilder<AuthModel>().fetch(
        Get.context!,
        future: () async {
          final login = UserRepository().login(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          return login;
        },
        onComplete: (snapshot) {
          if (snapshot.success == true) {
            CustomToast.showMessage(message: snapshot.message!,messageType: MessageType.succsess);
            storage.setTokenInfo(snapshot.data!.token!);
            storage.setUser(snapshot.data!);
            storage.setFirstLanuch(false);
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
