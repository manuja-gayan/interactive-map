import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
