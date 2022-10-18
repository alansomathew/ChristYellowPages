import 'package:get/get.dart';

import '../database/controllers/category_contact/category_controller.dart';
import '../design/screens/home/home_screen.dart';
import '../design/screens/splashScreen/onboarding_screen.dart';
import '../design/screens/splashScreen/splash_screen.dart';
import '../design/screens/splashScreen/welcome_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/onboarding", page: () => OnBoardingScreen()),
        GetPage(name: "/welcome", page: () => WelcomeScreen()),
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(CategoryController());
          }),
        ),
      ];
}
