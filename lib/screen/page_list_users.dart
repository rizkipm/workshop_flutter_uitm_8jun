import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uitm_8jun/models/model_users.dart';

class PageListUser extends StatefulWidget {
  const PageListUser({super.key});

  @override
  State<PageListUser> createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  bool isLoading = false;
  List<ModelUsers> listUser = [];

  //method get data user from api
  Future getUser() async {
    try {
      //do in background
      setState(() {
        isLoading = true;
      });

      http.Response res = await http
          .get((Uri.parse("https://jsonplaceholder.typicode.com/users")));
      var data = jsonDecode(res.body);
      setState(() {
        for (Map<String, dynamic> i in data) {
          listUser.add(ModelUsers.fromJson(i));
        }
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  //setState : perubahan pada widget atau ui
  //initState : perubahan sebelum ui di panggil
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'List Staff',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index){
          return Padding(padding: EdgeInsets.all(10),
            child: Card(
              child: ListTile(
                title: Text(listUser[index].name ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(listUser[index].email ?? ""),
                    Text(listUser[index].address.city ?? ""),
                    Text(listUser[index].phone ?? ""),
                    Text(listUser[index].company.name ?? ""),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
