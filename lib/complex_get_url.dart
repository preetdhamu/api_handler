import 'dart:convert';
import 'dart:developer';

import 'package:api_handler/model/complex.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Complex_Json extends StatefulWidget {
  const Complex_Json({super.key});

  @override
  State<Complex_Json> createState() => _Complex_JsonState();
}

class _Complex_JsonState extends State<Complex_Json> {
  List data = [];
  bool loading = false;
  getData() async {
    loading = true;
    final response = await http.get(
        Uri.parse("https://webhook.site/0933fa08-ce5d-4ab5-a1b4-aaca47d9d0bb"));
    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body.toString())['data'];
      setState(() {
        data = data1.map((e) => Data.fromJson(e)).toList();
        log(data.toString());
      });
    } else {
      throw Future.error("SOmeTHing Wrong Happen");
    }
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex JSON'),
      ),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Image.network(
                        "https://images.pexels.com/photos/17604370/pexels-photo-17604370/free-photo-of-beautiful-woman-sitting-under-a-tree.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    "${data[index].shop?.name}",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 16),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data[index]?.categories?.type}"),
                      Text("${data[index]?.description}"),
                      Text("${data[index]?.price}"),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
