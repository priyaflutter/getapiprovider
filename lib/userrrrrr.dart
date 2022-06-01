import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class use extends StatefulWidget {
  const use({Key? key}) : super(key: key);

  @override
  State<use> createState() => _useState();
}

class _useState extends State<use> {
  List<viewdata> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }

  Future<void> getmyvalue() async {
    var url = Uri.parse('https://fakestoreapi.com/users');
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
      appBar: AppBar(title: Text("User"), backgroundColor: Colors.black),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight * 0.45,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text("Id",style: TextStyle(fontSize: bodyheight*0.02,fontWeight: FontWeight.bold),),
                      Text(
                        " ${list[index].id}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: bodyheight*0.02,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Adrdress:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.15,
                      ),
                      Text(
                        "Geolocation :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.30,
                      ),
                      Text(
                        "lat : ${list[index].address!.geolocation!.lat}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.30,
                      ),
                      Text(
                        "long : ${list[index].address!.geolocation!.long}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "City : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: "${list[index].address!.city}",
                                style: TextStyle(color: Colors.black45))
                          ]))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Street : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: "${list[index].address!.street}",
                                style: TextStyle(color: Colors.black45))
                          ]))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "number : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: "${list[index].address!.number}",
                                style: TextStyle(color: Colors.black45))
                          ]))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "zipcode : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: "${list[index].address!.zipcode}",
                                style: TextStyle(color: Colors.black45))
                          ]))
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Email : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${list[index].email}",
                            style: TextStyle(color: Colors.black45))
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "Username : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${list[index].username}",
                            style: TextStyle(color: Colors.black45))
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "Password : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${list[index].password}",
                            style: TextStyle(color: Colors.black45))
                      ])),
                  Text(
                    "${Name} :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Firstname : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "${list[index].name!.firstname}",
                                    style: TextStyle(color: Colors.black45))
                              ]))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: twidth * 0.16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Lastname : ",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "${list[index].name!.lastname}",
                                    style: TextStyle(color: Colors.black45))
                              ]))
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Phone : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].phone}",
                                style: TextStyle(color: Colors.black45))
                          ])),
                  RichText(
                      text: TextSpan(
                          text: "__V : ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                text: "${list[index].iV}",
                                style: TextStyle(color: Colors.black45))
                          ])),

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
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? iV;

  viewdata(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV});

  viewdata.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    phone = json['phone'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    return data;
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    geolocation = json['geolocation'] != null
        ? new Geolocation.fromJson(json['geolocation'])
        : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geolocation != null) {
      data['geolocation'] = this.geolocation!.toJson();
    }
    data['city'] = this.city;
    data['street'] = this.street;
    data['number'] = this.number;
    data['zipcode'] = this.zipcode;
    return data;
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    return data;
  }
}
