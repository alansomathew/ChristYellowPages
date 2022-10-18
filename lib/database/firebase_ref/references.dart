import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

final fireStore = FirebaseFirestore.instance;
final userRF = fireStore.collection("users");
final departmentCategoryRF = fireStore.collection("departments");
DocumentReference contactRF({
  required String categoryId,
  required String contactId,
}) =>
    departmentCategoryRF.doc(categoryId).collection("contacts").doc(contactId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FsirebaseStorageServices extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child('departments_image/')
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      print(e);
    }
  }
}
