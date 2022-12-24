import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier {
  bool isLoading = false;
  String title = 'Schedule App';

  set setIsLoading(bool isLogin) {
    isLoading = isLogin;
    notifyListeners();
  }
}
