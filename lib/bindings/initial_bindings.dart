import 'package:get/get.dart';

import '../database/controllers/auth_controller.dart';
import '../database/controllers/theme_controller.dart';
import '../database/controllers/zoom_drawer_controller.dart';
import '../database/services/firebase_storage_services.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    // Get.put(NotificationService());
    Get.lazyPut(() => FirebaseStorageService());
    Get.put(MyZoomDrawerController());
  }
}
