import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

// lst list ni avtu

class _cartState extends State<cart> {

  List<viewdata> list=[];
  List<Products> list1=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getmyvalue();
  }
  Future<void> getmyvalue() async {

    var url = Uri.parse('https://fakestoreapi.com/carts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List vv=jsonDecode(response.body);
    for(int i=0;i<vv.length;i++)
      {
          viewdata view=viewdata.fromJson(vv[i]);
          list.add(view);
            for(int v=0;v<vv.length;v++)
              {
                Products view1=Products.fromJson(vv[v]);
                setState(() {
                   list1.add(view1);
                });
              }

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
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.black),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount:list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight * 0.45,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Id : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: bodyheight*0.02,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].id}",
                                style: TextStyle(fontSize: bodyheight*0.02,fontWeight: FontWeight.bold,color: Colors.black45))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: "User Id : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: bodyheight*0.02,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].userId}",
                                style: TextStyle(fontSize: bodyheight*0.02,fontWeight: FontWeight.bold,color: Colors.black45))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: "Date : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: bodyheight*0.02,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].date}",
                                style: TextStyle(fontSize: bodyheight*0.02,fontWeight: FontWeight.bold,color: Colors.black45))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: "__V : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: bodyheight*0.02,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].iV}",
                                style: TextStyle(fontSize: bodyheight*0.02,fontWeight: FontWeight.bold,color: Colors.black45))
                          ])),
                  Text("Products : ",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: twidth * 0.16,
                  //     ),
                  //     RichText(
                  //         text: TextSpan(
                  //             text: "ProductID : ",
                  //             style: TextStyle(
                  //                 color: Colors.blue,
                  //                 fontWeight: FontWeight.bold),
                  //             children: [
                  //               TextSpan(
                  //                   text: "${list[index].products![index].productId}",
                  //                   style: TextStyle(color: Colors.black45))
                  //             ]))
                  //   ],
                  // ),
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
  int? userId;
  String? date;
  List<Products>? products;
  int? iV;

  viewdata({this.id, this.userId, this.date, this.products, this.iV});

  viewdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}

