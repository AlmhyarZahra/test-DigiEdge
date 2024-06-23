import 'package:auto/core/data/network/api_service.dart';
import 'package:auto/ui/shared/custom_widgets/custom_toast.dart';

class AppErrorFeedback {
  //network
  static const String networkRequestFailed = 'network-request-failed';
  static const String timeOutException = 'timeout_exception';
  static const String requestTimeOut = 'request-timeout';

  //general
  static const String generalError = 'general-error';

  static void show(
    Failure failure, {
    Function()? onGeneralError,
    Function()? onInternetError,
    Function()? onServerError,
  }) {
    switch (failure.code) {
      /// network exception
      case networkRequestFailed:
      case requestTimeOut:
      case timeOutException:
        CustomToast.showMessage(message: "Internet Connection Error");

      ///Exception type
      default:
        switch (failure.type) {
          case ApiService.httpException:
          case ApiService.formatException:
            onServerError == null ? CustomToast.showMessage(message: "Oops, Something went wrong !") : onServerError();
          case ApiService.timeoutException:
          case ApiService.socketException:
            onInternetError == null ? CustomToast.showMessage(message: "Internet Connection Error") : onInternetError();
          default:
            onGeneralError == null ? CustomToast.showMessage(message: "Oops, Something went wrong !") : onGeneralError();
        }
    }
  }
}
