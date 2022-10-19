import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import './auth_controller.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerControllers = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerControllers.toggle?.call();
    update();
  }

  void signOut() {
    // print('hello');
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void restaurants() {}
}
