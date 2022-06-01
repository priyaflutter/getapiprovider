import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class photoss extends StatefulWidget {
  const photoss({Key? key}) : super(key: key);

  @override
  State<photoss> createState() => _photossState();
}

class _photossState extends State<photoss> {
  List<viewdata> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmydata();
  }

  Future<void> getmydata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
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
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbatheight = MediaQuery.of(context).padding.top;
    double navibartheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbatheight - tappbar;

    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
        backgroundColor: Colors.black,
      ),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight * 0.23,
              width: double.infinity,
             padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: bodyheight * 0.12,
                        width: twidth * 0.20,
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage("${list[index].url}"),
                                fit: BoxFit.cover)),
                        // child: CircleAvatar(
                        //   backgroundImage: NetworkImage('${list[index].url}'),
                        // ),
                      ),
                      SizedBox(
                        width: twidth * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          height: bodyheight * 0.20,
                          width: double.infinity,
                          // decoration:
                          //     BoxDecoration(border: Border.all(width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Text(
                                    "   ${list[index].id}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Text(
                                  "   ${list[index].title}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [SizedBox(width: twidth*0.63,),Expanded(
                                  child: Card(
                                    child: Container(
                                      height: bodyheight * 0.05,
                                      width: twidth * 0.10,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${list[index].thumbnailUrl}"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),],
                              ),
                            ],
                          ),
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
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return first();
      },
    ));

    return Future.value(true);
  }
}

class viewdata {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  viewdata({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  viewdata.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
