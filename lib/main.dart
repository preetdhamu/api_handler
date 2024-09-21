import 'package:api_handler/Get_all_products.dart';
import 'package:api_handler/complex_get_url.dart';
import 'package:api_handler/post_images.dart';
import 'package:api_handler/sign_up_post.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Api Handler ",
      home: const UploadImage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
