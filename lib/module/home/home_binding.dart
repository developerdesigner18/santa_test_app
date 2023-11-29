import 'package:get/instance_manager.dart';
import 'package:test_task_santa/module/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}