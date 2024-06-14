import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SortedUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SortedUserState();
  }
}

class _SortedUserState extends State<SortedUser> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sorted Users "),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by name ',
            ),
            onChanged: (value) {
              setState(() {
                result = value;
              });
            },
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .orderBy('name')
                  .startAt([result]).endAt([result + '\uf8ff']).snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error : ${snapshot.error}"),
                  );
                } else {
                  if (snapshot.connectionState == ConnectionState.waiting ) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }

                  final data = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var user = data[index];
                      return ListTile(
                        title: Text("${user['name']}"),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
