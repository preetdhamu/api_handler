import 'package:flutter/material.dart';

class HOmePage extends StatefulWidget {
  const HOmePage({super.key , required this.token});
  final String token; 

  @override
  State<HOmePage> createState() => _HOmePageState();
}

class _HOmePageState extends State<HOmePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          Text("Your Token is : ${widget.token}"),
        ],
      ),
    );
  }
}
