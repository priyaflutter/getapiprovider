import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class album extends StatefulWidget {
  const album({Key? key}) : super(key: key);

  @override
  State<album> createState() => _albumState();
}

class _albumState extends State<album> {

  List<viewdata> list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmylist();

  }
  Future<void> getmylist() async {
    
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    List vv=jsonDecode(response.body);
    for(int i=0;i<vv.length;i++)
      {
         viewdata view=viewdata.fromJson(vv[i]);
         setState(() {
            list.add(view);
         });
          
      }

  }
  @override
  Widget build(BuildContext context) {

    double theight=MediaQuery.of(context).size.height;
    double twidth=MediaQuery.of(context).size.width;
    double statusbatheight=MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    double tappbar=kToolbarHeight;

    double bodyheight=theight - navibartheight -statusbatheight - tappbar;

    return Scaffold(
      appBar: AppBar(
        title: Text("Alubm"),
        backgroundColor: Colors.black,
      ),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Icon(Icons.arrow_right,size: 25,),
                  Text("  ${list[index].id}"),
                ],
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.title,size: 20,),
                  Expanded(child: Text("  ${list[index].title}",style: TextStyle(fontWeight: FontWeight.w900),)),
                ],
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1)),
            );
          },
        ),
      ),
    );
  }

  Future<bool> onback() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
         return first();
    },));

    return Future.value(true);
  }
}

class viewdata {
  int? userId;
  int? id;
  String? title;

  viewdata({this.userId, this.id, this.title});

  viewdata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

