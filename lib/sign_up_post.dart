import 'dart:developer';
// import 'dart:js_interop';

// import 'package:api_handler/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent[100],
              borderRadius: BorderRadius.circular(12.0)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    Response response = await post(
                      Uri.parse("https://reqres.in/api/register"),
                      body: {"email": email.text, "password": password.text},
                    );

                    if (response.statusCode == 200) {
                      log(response.body);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HOmePage(token: 'response.body.toString()}',),));
                    }
                  } on Exception catch (e) {
                    log(e.toString());
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.lightBlueAccent[200], fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
