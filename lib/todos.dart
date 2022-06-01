import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class todo extends StatefulWidget {
  const todo({Key? key}) : super(key: key);

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {

  List<viewdata> list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }
  Future<void> getmyvalue() async {

    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
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
        title: Text("Todos"),
        backgroundColor: Colors.black,
      ),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight*0.15,
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
                          "   ${list[index].id}",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios),
                      Text("  Title :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Expanded(
                        child: Text(
                          "  ${list[index].title}",
                          style: TextStyle(fontSize: 15,),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.radio_button_checked_sharp),
                      Text("  Completed :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Expanded(
                        child: Text(
                          "   ${list[index].completed}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
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
  bool? completed;

  viewdata({this.userId, this.id, this.title, this.completed});

  viewdata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}

