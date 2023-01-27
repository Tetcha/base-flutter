import 'package:get/get.dart';

class UIProvider extends GetxController {
  bool isLoading = false;
  String title = 'Schedule App';

  set setIsLoading(bool isLogin) {
    isLoading = isLogin;
    update();
  }
}
