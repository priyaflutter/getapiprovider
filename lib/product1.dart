import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class product1 extends StatefulWidget {
  const product1({Key? key}) : super(key: key);

  @override
  State<product1> createState() => _product1State();
}

//  map of map    done

class _product1State extends State<product1> {
  viewdata? view;
  bool status=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalye();
  }

  Future<void> getmyvalye() async {
    var url = Uri.parse('https://fakestoreapi.com/products/1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print("objecttttttttttttttttttttt");

    var vv = jsonDecode(response.body);
    print("Strifnggnggggggggg");
    setState(() {
      view = viewdata.fromJson(vv);
      status=true;

    });
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
      appBar: AppBar(title: Text("Product"), backgroundColor: Colors.black),
      body:status? WillPopScope(
        onWillPop: onback,
        child: Container(
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
                            image: NetworkImage("${view!.image}"),
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
                                      text: "${view!.title}",
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
                                      text: "${view!.price.toString()}",
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
                                      text: "${view!.description}",
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
                                      text: "${view!.category}",
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
                                      text: "${view!.rating!.rate.toString()}",
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
                                      text: "${view!.rating!.count}",
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
        ),
      ):Center(child: CircularProgressIndicator()),
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
  double? price;
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
