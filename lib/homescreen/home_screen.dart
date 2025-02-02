import 'package:flutter/material.dart';
import 'package:restapi_testing/model/login_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginemailController = TextEditingController();
    var loginpasswordController = TextEditingController();

    LoginRequestModel requestModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
                controller: loginemailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.text_fields),
                )),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: loginpasswordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.text_fields),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {

            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
