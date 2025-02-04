import 'package:flutter/material.dart';
import 'package:restapi_testing/model/custom_user_model.dart';

import 'package:restapi_testing/service/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CustomUserModel> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(users.length, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 100,
              height: 50,
              color: Colors.red,
              child: Text(users[index].name!.first),
            );
          }),
        ),
      ),
    );
  }
}
