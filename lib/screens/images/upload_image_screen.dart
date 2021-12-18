import 'dart:io';

import 'package:elancer_api/api/controllers/images_api_controller.dart';
import 'package:elancer_api/get/images_getx_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> with Helpers {
  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;
  double? _linearProgressValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 10,
            color: Colors.green,
            backgroundColor: Colors.blue.shade200,
            value: _linearProgressValue,
          ),
          Expanded(
            child: _pickedFile != null
                ? Image.file(File(_pickedFile!.path))
                : TextButton(
                    onPressed: () async => _pickImage(),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: const Text("Pick Image"),
                  ),
          ),
          ElevatedButton.icon(
            onPressed: () async => await performUpload(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
            ),
            icon: const Icon(Icons.cloud_upload),
            label: const Text(
              'UPLOAD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality:50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
    }
  }

  Future<void> performUpload() async {
    if (checkData()) {
      await uploadImage();
    }
  }

  bool checkData() {
    if (_pickedFile != null) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Select image to upload',
      error: true,
    );
    return false;
  }

  Future<void> uploadImage() async {
    _changeProgressValue(value: null);
    ImagesGetxController.to.uploadImage(
      context: context,
      path: _pickedFile!.path,
      uploadImageCallback: ({required String message, required bool status, studentImage}) {
        if(status){
          _changeProgressValue(value: 1);
          showSnackBar(context: context, message: message);
        }else{
          _changeProgressValue(value: 0);
          showSnackBar(context: context, message: message,error: true);
        }
      },
    );
  }

  void _changeProgressValue({double? value}) {
    setState(() {
      _linearProgressValue = value;
    });
  }
}
