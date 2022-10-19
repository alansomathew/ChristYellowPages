import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../database/controllers/category_contact/category_controller.dart';
import '../../../database/controllers/zoom_drawer_controller.dart';
import '../../configs/Icons/app_icons.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_style.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';
import './category_card.dart';
import './menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    CategoryController _categoryController = Get.find();

    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          showShadow: true,
          angle: 0.0,
          backgroundColor: Colors.white.withOpacity(0.5),
          style: DrawerStyle.DefaultStyle,
          slideWidth: MediaQuery.of(context).size.width * .6,
          controller: _.zoomDrawerControllers,
          mainScreen: Container(
            decoration: BoxDecoration(
              gradient: mainGradient(),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppCircleButton(
                          onTap: controller.toogleDrawer,
                          child: const Icon(
                            AppIcons.menuLeft,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                'Hello Alanso',
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Christ YelloW Pages',
                          style: headerText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => ListView.separated(
                          shrinkWrap: true,
                          padding: UIParameters.mobileScreenPadding,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryCard(
                                model: _categoryController.allCategory[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: _categoryController.allCategory.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          menuScreen: MenuScreen(),
        );
      }),
    );
  }
}
