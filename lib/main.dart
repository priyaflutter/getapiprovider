import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getapi/albums.dart';
import 'package:getapi/cart.dart';
import 'package:getapi/catgories.dart';
import 'package:getapi/commets.dart';
import 'package:getapi/diopackage.dart';
import 'package:getapi/jewelry.dart';
import 'package:getapi/photos.dart';
import 'package:getapi/product.dart';
import 'package:getapi/product1.dart';
import 'package:getapi/productlimit5.dart';
import 'package:getapi/todos.dart';
import 'package:getapi/user.dart';
import 'package:getapi/userrrrrr.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  // posts

  List<viewdata> mylist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv = jsonDecode(response.body);

    for (int i = 0; i < vv.length; i++) {
      viewdata view = viewdata.fromJson(vv[i]);
      setState(() {
        mylist.add(view);
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
        title: Text("Posts"),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: bodyheight * 0.10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return first();
                  },
                ));
              },
              child: ListTile(
                title: Text("Posts", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return comment();
                  },
                ));
              },
              child: ListTile(
                title: Text("Comment", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return album();
                  },
                ));
              },
              child: ListTile(
                title: Text("Album", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return photoss();
                  },
                ));
              },
              child: ListTile(
                title: Text("Photo", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return todo();
                  },
                ));
              },
              child: ListTile(
                title: Text("Todos", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return userrrrr();
                  },
                ));
              },
              child: ListTile(
                title: Text("User", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return product();
                  },
                ));
              },
              child: ListTile(
                title: Text("Product", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return product1();
                  },
                ));
              },
              child: ListTile(
                title: Text("Product1", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return catogaris();
                  },
                ));
              },
              child: ListTile(
                title: Text("Catogary", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return jewel();
                  },
                ));
              },
              child: ListTile(
                title: Text("Jewellry", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return productlimit();
                  },
                ));
              },
              child: ListTile(
                title: Text("Product Limit", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return use();
                  },
                ));
              },
              child: ListTile(
                title: Text("User", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return cart();
                  },
                ));
              },
              child: ListTile(
                title: Text("Cart", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return dioo();
                  },
                ));
              },
              child: ListTile(
                title: Text("Dio", style: TextStyle(fontSize: 20)),
                leading: Icon(Icons.list),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context, index) {
          return Dismissible( direction:DismissDirection.startToEnd ,
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                print("Delete");
              }

            },
            confirmDismiss: (direction) {
              return showDialog(
                builder: (context) {
                  return AlertDialog(
                    content: Text("Are you Sure want to Delete?"),
                    title: Text(
                      "Delete Forever",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xf501010e))),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              mylist.removeAt(index);
                            });
                          },
                          child: Text("Delete"),  style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xf501010e))),)
                    ],
                  );
                },
                context: context,
              );
            },
            key: Key(mylist.toString()),
            background: Container(
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.delete_forever,size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "     Move to Trash",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  )
                ],
              ),
            ),
            child: ListTile(
              title: Row(
                children: [
                  Icon(Icons.arrow_right),
                  Expanded(
                      child: Text(
                    "${mylist[index].title}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              subtitle: Text("${mylist[index].body}"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1)),
            ),
          );
        },
      ),
    );
  }
}

class viewdata {
  int? userId;
  int? id;
  String? title;
  String? body;

  viewdata({this.userId, this.id, this.title, this.body});

  viewdata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
