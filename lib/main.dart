import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"Api Handler ",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
