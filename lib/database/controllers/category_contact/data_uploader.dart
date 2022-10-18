import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert';

import '../../firebase_ref/references.dart';
import '../../models/category_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final maniFestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> maniFestMap = json.decode(maniFestContent);
    //load json file and print path

    final categoryInAssets = maniFestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/categoryies/") && path.contains(".json"))
        .toList();
    List<CategoryModel> categories = [];
    for (var category in categoryInAssets) {
      String stringCategoryContent = await rootBundle.loadString(category);
      categories
          .add(CategoryModel.fromJson(json.decode(stringCategoryContent)));
    }
    var batch = fireStore.batch();
    for (var category in categories) {
      batch.set(departmentCategoryRF.doc(category.id), {
        "title": category.title,
        "description": category.description,
        "email": category.email,
      });

      for (var contact in category.contacts!) {
        final contactPath =
            contactRF(categoryId: category.id, contactId: contact.id);
        batch.set(contactPath, {
          "employeeid": contact.employeeid,
          "image_url": contact.imageUrl,
          "name": contact.name,
          "emp_email": contact.empEmail,
          "emp_contact": contact.empContact,
        });
      }
    }
    await batch.commit();
    print("upload finishing");
  }
}
