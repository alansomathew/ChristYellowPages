import 'package:get/get.dart';

import '../database/controllers/category_contact/category_controller.dart';
import '../design/screens/home/home_screen.dart';
import '../design/screens/splashScreen/onboarding_screen.dart';
import '../design/screens/splashScreen/splash_screen.dart';
import '../design/screens/splashScreen/welcome_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
        GetPage(name: OnBoardingScreen.routeName, page: () => OnBoardingScreen()),
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(
          name: HomeScreen.routeName,
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(CategoryController());
          }),
        ),
      ];
}
