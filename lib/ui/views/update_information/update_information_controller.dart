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

class UpdateInformationController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: storage.getUser().name);
  TextEditingController phoneController = TextEditingController(text: storage.getUser().phone);
  TextEditingController emailController = TextEditingController(text: storage.getUser().email);
  RxString countryCode = storage.getUser().countryCode!.obs;


  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }


  void updateInformation() {
    if (formKey.currentState!.validate()) {
      ApiFutureBuilder<AuthModel>().fetch(
        Get.context!,
        future: () async {
          final updateInfo = UserRepository().updateProfile(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim(),
            countryCode: countryCode.value,
          );
          return updateInfo;
        },
        onComplete: (snapshot) {
          if (snapshot.success == true) {
            CustomToast.showMessage(message: "Your information is updated successfully",messageType: MessageType.succsess);
            storage.setUser(snapshot.data!);
            Get.offAll(() => const HomeView());
          } else if(snapshot.success == false) {
            CustomToast.showMessage(message: snapshot.message!,messageType: MessageType.rejected);
          }
        },
        onError: (failure) => AppErrorFeedback.show(failure),
      );
    }
  }
}