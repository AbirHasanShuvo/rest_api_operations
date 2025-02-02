import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisteresSuccess extends StatefulWidget {
  const RegisteresSuccess({super.key});

  @override
  State<RegisteresSuccess> createState() => _RegisteresSuccess();
}

class _RegisteresSuccess extends State<RegisteresSuccess> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passworController = TextEditingController();

    registeredUser(String email, String password) async {
      Uri url = Uri.parse("https://reqres.in/api/register");
      
      

      var data = {'email': email, 'password': password};

      try {
        var response = await http.post(url, body: data);
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          print(jsonData);
          Get.snackbar("Congratulations", "Successfully registered");
        } else {
          var error = jsonDecode(response.body);
          print("Unable to register ${error['error']}");
        }
      } catch (error) {
        print("error $error");
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                // prefixIcon: Icon(Icons.text_fields),
              )),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: passworController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                // prefixIcon: Icon(Icons.text_fields),
              )),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                registeredUser(emailController.text.toString(),
                    passworController.text.toString());
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
