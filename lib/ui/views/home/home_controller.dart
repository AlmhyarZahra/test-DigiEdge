import 'package:auto/core/data/models/apis/password_model.dart';
import 'package:auto/core/data/network/api_service.dart';
import 'package:auto/core/data/repositories/shared_preference_repository.dart';
import 'package:auto/core/data/repositories/user_repository.dart';
import 'package:auto/core/enums/message_type.dart';
import 'package:auto/ui/shared/alert/errors/app_error_feedback.dart';
import 'package:auto/ui/shared/custom_widgets/custom_toast.dart';
import 'package:auto/ui/views/welcome/welcome_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{


  void deleteAccount() {
      ApiFutureBuilder<PassordModel>().fetch(
        Get.context!,
        future: () async {
          final delete = UserRepository().deleteAcount();
          return delete;
        },
        onComplete: (snapshot) {
          if (snapshot.success == true) {
            CustomToast.showMessage(message:snapshot.message! ,messageType: MessageType.succsess);
            SharedPreferenceRepository.clearStorage();
            Get.offAll(()=> const WelcomeView());
          } else if(snapshot.success == false) {
            CustomToast.showMessage(message: snapshot.message!,messageType: MessageType.rejected);
          }
        },
        onError: (failure) => AppErrorFeedback.show(failure),
      );
  }

  void logout(){
    SharedPreferenceRepository.clearStorage();
    Get.offAll(()=> const WelcomeView());
  }
}