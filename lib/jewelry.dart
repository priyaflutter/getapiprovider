import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class jewel extends StatefulWidget {
  const jewel({Key? key}) : super(key: key);

  @override
  State<jewel> createState() => _jewelState();
}

// 5 to 8 map ni avta

class _jewelState extends State<jewel> {
  List<viewdata> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }

  Future<void> getmyvalue() async {
    var url = Uri.parse('https://example.com/whatsit/create');
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv = jsonDecode(response.body.toString());
    for (int i = 0; i < vv.length; i++) {
      viewdata view = viewdata.fromJson(vv[i]);
      list.add(view);
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
      appBar: AppBar(title: Text("Jwellery"), backgroundColor: Colors.black),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight * 0.43,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: bodyheight * 0.15,
                        width: twidth * 0.25,
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage("${list[index].image}"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: twidth * 0.05,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "title : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].title}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "price : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].price}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "Description : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].description}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "catogary : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].category}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "rating : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "          ✔ ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].rating!.rate}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      text: "          ✔ ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                      text: "${list[index].rating!.count}",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                            ],
                          ),
                        ),
                      )
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
  int? id;
  String? title;
  int? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  viewdata(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  viewdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
