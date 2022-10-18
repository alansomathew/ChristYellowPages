import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/controllers/category_contact/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Uploading',
        ),
      ),
    );
  }
}
