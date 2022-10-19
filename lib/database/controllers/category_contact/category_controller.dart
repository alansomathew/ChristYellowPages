import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../models/category_model.dart';
import '../../services/firebase_storage_services.dart';
import '../auth_controller.dart';

// Reference get firebaseStorage => FirebaseStorage.instance.ref();

class CategoryController extends GetxController {
  var isLoading = false;
  final allCategoryImages = <String>[].obs;
  final allCategory = <CategoryModel>[].obs;

  @override
  void onReady() {
    getAllCategory();
    super.onReady();
  }

  Future<void> getAllCategory() async {
    List<String> imgName = [
      "logo",
    ];
    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await departmentCategoryRF.get();
      final categoryList =
          data.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      allCategory.assignAll(categoryList);

      for (var cat in categoryList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(cat.title);
        cat.imgUrl = imgUrl!;
      }
      allCategory.assignAll(categoryList);
    } catch (e) {
      print(e);
    }
  }
  void navigateToContacts({required CategoryModel category, bool tryAgain=false}){
    AuthController _authController=Get.find();
    if(_authController.isLoggedIn()){
      if(tryAgain){
Get.back();
// Get.offNamed('/home');
      }else{
        _authController.navigateToWelcome();
      }
    }
    else{
      _authController.navigateToIndroduction();
    }
  }
}
