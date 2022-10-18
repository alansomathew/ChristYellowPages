import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerControllers = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerControllers.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}
}
