import 'package:flutter/cupertino.dart' show ChangeNotifier;

class ApiProvider extends ChangeNotifier {
  bool isGlobalLoading = false;
  bool isLocalLoading = false;
  String test = 'test message';
  Map<String, String> errorDetails = {};
  bool isError = false;
  String? message;
  String? errorMessage;

  set setGlobalLoading(bool value) {
    isGlobalLoading = value;
    notifyListeners();
  }

  set setLocalLoading(bool value) {
    isLocalLoading = value;
    notifyListeners();
  }

  void clearErrorDetails() {
    errorDetails = {};
    notifyListeners();
  }

  void setErrorDetails(Map<String, String> data) {
    errorDetails = data;
    notifyListeners();
  }

  String? getErrorByField(String field) {
    return errorDetails[field];
  }
}
