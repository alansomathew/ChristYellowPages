import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/controllers/zoom_drawer_controller.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_circle_button.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});
  static const String routeName = '/menu';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: onSurfaceTextColor,
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: AppCircleButton(
                  onTap: controller.toogleDrawer,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () => controller.user.value == null
                          ? SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor,
                              ),
                            ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icon: Icons.restaurant_sharp,
                      label: 'Restaurants',
                      onPressed: () => controller.restaurants(),
                    ),
                    _DrawerButton(
                      icon: Icons.info,
                      label: 'About',
                      onPressed: () => controller.restaurants(),
                    ),
                    _DrawerButton(
                      icon: Icons.message,
                      label: 'Complaints',
                      onPressed: () => controller.restaurants(),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    _DrawerButton(
                      icon: Icons.logout,
                      label: 'Logout',
                      onPressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
        icon,
        size: 15,
      ),
      onPressed: onPressed,
      label: Text(
        label,
      ),
    );
  }
}
