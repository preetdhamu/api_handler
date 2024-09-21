import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  bool see = false;
  Future pickImage() async {
    final pickedImage =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    } else {
      debugPrint("NO Images Selected ");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      see = true;
    });
    try {
      var stream = http.ByteStream(image!.openRead());
      stream.cast();

      var length = await image!.length();
      var uri = Uri.parse('https://api.escuelajs.co/api/v1/files/upload');
      var request = http.MultipartRequest("POST", uri);

      // request.field[]

      var multiport = http.MultipartFile('file', stream, length);

      request.files.add(multiport);
      var response = await request.send();
      if (response.statusCode == 200) {
        setState(() {
          see = false;
        });
        debugPrint("Image uploaed Successfully");
      }
    } catch (e) {
      debugPrint("${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: see,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Image"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              pickImage();
            },
            child: image == null
                ? const SizedBox(
                    width: 200,
                    height: 200,
                    child: Text("Pick Your Image "),
                  )
                : Column(
                    children: [
                      Image.file(
                        File(image!.path),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: () {
                          uploadImage();
                        },
                        child: const SizedBox(
                          height: 20,
                          width: 50,
                          child: Text("UPload Image "),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
