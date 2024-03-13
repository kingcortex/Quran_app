import 'package:get/get.dart';

class AppController extends GetxController {
  int index = 0;

  void changePage(int value) {
    if (index != value) {
      index = value;
    }
    update();
  }
}