import 'package:get/get.dart';

class ApiProvider extends GetxController {
  bool isGlobalLoading = false;
  bool isLocalLoading = false;
  Map<String, String> errorDetails = {};
  bool isError = false;
  String? message;
  String? errorMessage;

  set setGlobalLoading(bool value) {
    isGlobalLoading = value;
    update();
  }

  set setLocalLoading(bool value) {
    isLocalLoading = value;
    update();
  }

  void clearErrorDetails() {
    errorDetails = {};
    update();
  }

  void setErrorDetails(Map<String, String> data) {
    errorDetails = data;
    update();
  }

  String? getErrorByField(String field) {
    return errorDetails[field];
  }
}
