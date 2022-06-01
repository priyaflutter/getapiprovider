import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

// 4 list ave chhe

class _productState extends State<product> {
  List<viewdata> list = [];
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyvalue();
  }

  Future<void> getmyvalue() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv = jsonDecode(response.body);
    for (int i = 0; i < vv.length; i++) {
      viewdata view = viewdata.fromJson(vv[i]);
      setState(() {
        list.add(view);
        status = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery
        .of(context)
        .size
        .height;
    double twidth = MediaQuery
        .of(context)
        .size
        .width;
    double statusbatheight = MediaQuery
        .of(context)
        .padding
        .top;
    double navibartheight = MediaQuery
        .of(context)
        .padding
        .bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - navibartheight - statusbatheight - tappbar;

    return Scaffold(
        appBar: AppBar(title: Text("Product"), backgroundColor: Colors.black),
        body: WillPopScope(
          onWillPop: onback,
          child:status? ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                height: bodyheight * 0.75,
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
                              // border: Border.all(width: 1),
                              // borderRadius: BorderRadius.all(
                              //     Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage("${list[index].image}"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: twidth * 0.05,),
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
                                          TextSpan(text: "${list[index].title}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold
                                            ),)
                                        ])),
                                RichText(
                                    text: TextSpan(
                                        text: "price : ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: "रु ${list[index].price}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold
                                            ),)
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
                                                fontWeight: FontWeight.bold,
                                            ),)
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
                                                fontWeight: FontWeight.bold
                                            ),)
                                        ])),
                                RichText(
                                    text: TextSpan(
                                        text: "rating : ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(text: "", style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold
                                          ),)
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
                                                fontWeight: FontWeight.bold
                                            ),)
                                        ])),
                                RichText(
                                    text: TextSpan(
                                        text: "          ✔ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(text: "${list[index].rating!
                                              .count}", style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold
                                          ),)
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
          ): Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.black,
                    enabled: status,
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: bodyheight*0.20,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: twidth*0.20,
                                height: bodyheight*0.10,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount:10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          status = !status;
                        });
                      },
                      child: Text(
                        status ? '' : '',
                        style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 18.0,
                            color: status ? Colors.redAccent : Colors.green),
                      )),
                )
              ],
            ),
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
  dynamic? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  viewdata({this.id,
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
  dynamic? rate;
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
