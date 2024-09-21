// import 'dart:convert';
// import 'package:api_handler/sorted_user.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }



// class _MyHomePageState extends State<MyHomePage> {
//   final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
//   String s = '';
//   bool isLoad = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchDataandStoreData();
//   }

//   Future<void > fetchDataandStoreData() async {
//     setState(() {
//       isLoad = true ; 
//     });
//     try{
//       List<dynamic> data =  await fetchData();
//       await storeData(data);
//     }
//     catch(e){
//       print("The error is : $e");
//     }
//   }


//   Future<List<dynamic>> fetchData() async {

//     final url = 'https://jsonplaceholder.typicode.com/users';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception("Failed to parse json data");
//     }
//   }

//   Future<void> storeData(List<dynamic> data) async {
//   for (var u in data) {
//     await FirebaseFirestore.instance.collection("users").add(u);
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Api Handler "),
//       ),
//       body: isLoad ? Center(child: CircularProgressIndicator(color: Colors.red,),): SortedUser(),
//     );
//   }
// }
