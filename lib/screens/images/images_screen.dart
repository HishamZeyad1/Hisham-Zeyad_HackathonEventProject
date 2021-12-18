import 'package:elancer_api/api/api_settings.dart';
import 'package:elancer_api/get/images_getx_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/models/student_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> with Helpers {
  final ImagesGetxController _imagesGetxController =
      Get.put(ImagesGetxController());
  List<StudentImage> _studentImages = <StudentImage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/upload_image_screen'),
            icon: const Icon(
              Icons.cloud_upload,
            ),
          )
        ],
      ),
      body: GetX<ImagesGetxController>(
        builder: (controller) {
          if (controller.studentImages.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: controller.studentImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        ApiSettings.getImageUrl(
                            controller.studentImages[index].image),
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          height: 45,
                          color: Colors.white60,
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          alignment: AlignmentDirectional.centerEnd,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  controller.studentImages[index].image,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () async => await deleteImage(
                                    id: controller.studentImages[index].id),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning,
                    size: 90,
                    color: Colors.grey,
                  ),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> deleteImage({required int id}) async {
    await ImagesGetxController.to.deleteImage(context, id: id);
  }
}
