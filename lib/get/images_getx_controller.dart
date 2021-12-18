import 'package:elancer_api/api/controllers/images_api_controller.dart';
import 'package:elancer_api/models/student_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesGetxController extends GetxController {
  RxList<StudentImage> studentImages = <StudentImage>[].obs;
  final ImagesApiController _imagesApiController = ImagesApiController();

  static ImagesGetxController get to => Get.find<ImagesGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //Read-Upload-Delete
  Future<void> read(BuildContext context) async {
    studentImages.value = await _imagesApiController.images(context);
  }

  Future<void> uploadImage(
      {required BuildContext context,
      required String path,
      required UploadImageCallback uploadImageCallback}) async {
    // _imagesApiController.uploadImage(path: 'path', uploadImageCallback: ({message, status, studentImage}) {},)
    await _imagesApiController.uploadImage(context,
      path: path,
      uploadImageCallback: (
          {required String message, required bool status, studentImage}) {
        if (status) studentImages.add(studentImage!);
        uploadImageCallback(status: status, message: message);
      },
    );
  }

  Future<bool> deleteImage(BuildContext context,{required int id}) async {
    bool deleted = await _imagesApiController.deleteImage(context, id: id);
    if(deleted) {
      int index = studentImages.indexWhere((element) => element.id == id);
      if(index != -1) {
        studentImages.removeAt(index);
      }
    }
    return deleted;
  }
}
