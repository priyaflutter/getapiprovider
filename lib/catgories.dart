import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class catogaris extends StatefulWidget {
  const catogaris({Key? key}) : super(key: key);

  @override
  State<catogaris> createState() => _catogarisState();
}

// Listtttt

class _catogarisState extends State<catogaris> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyvalue();
  }

  Future<void> getmyvalue() async {
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv = jsonDecode(response.body);

    for(int i=0;i<vv.length;i++)
      {
        
             print("============${vv.first.toString()}");


      }

    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( onWillPop: onback,
      child: Scaffold(
        appBar: AppBar(title: Text("Catogary"), backgroundColor: Colors.black),
        body: SafeArea(
            child: Container(
              height: 100,
          width: double.infinity,
          child: Column(
            children: [Text("${""}")],
          ),
        )),
      ),
    );
  }

  Future<bool> onback() {

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return first();
      },
    ));

    return Future.value(true);

  }
}
