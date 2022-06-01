import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class comment extends StatefulWidget {
  const comment({Key? key}) : super(key: key);

  @override
  State<comment> createState() => _commentState();
}

class _commentState extends State<comment> {
  List<viewdata> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyproduct();
  }

  Future<void> getmyproduct() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv = jsonDecode(response.body);
    for (int i = 0; i < vv.length; i++) {
      viewdata view = viewdata.fromJson(vv[i]);
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
        title: Text("Comment"),
        backgroundColor: Colors.black,
      ),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
        return Container(
          height: bodyheight*0.20,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  Expanded(
                    child: Text(
                      "   ${list[index].name}",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email_outlined),
                  Text(
                    "   ${list[index].email}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(child: Text("${list[index].body}",textAlign: TextAlign.justify,)),
            ],
          ),
        );
          },
        ),
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

class viewdata {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  viewdata({this.postId, this.id, this.name, this.email, this.body});

  viewdata.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}
