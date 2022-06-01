import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:http/http.dart' as http;

class userrrrr extends StatefulWidget {
  const userrrrr({Key? key}) : super(key: key);

  @override
  State<userrrrr> createState() => _userrrrrState();
}

class _userrrrrState extends State<userrrrr> {

  List<viewdata> list=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyvalue();
  }

  Future<void> getmyvalue() async {

    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
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
      appBar: AppBar(title: Text("User"), backgroundColor: Colors.black),
      body: WillPopScope(
        onWillPop: onback,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              height: bodyheight*0.54,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text("   ${list[index].id}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Name     : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].name}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Username: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].username}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Email      : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].email}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Address : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Street : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.street}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Suite : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.suite}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("City : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.city}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Zipcode : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.zipcode}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Geo         : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Lat  : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.geo!.lat}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Lng : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].address!.geo!.lng}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Phone : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].phone}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Website  : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].website}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 35,),
                      Text("Company: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Name : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].company!.name}"),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Catchphrase : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Expanded(child: Text("${list[index].company!.catchPhrase}")),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Bs : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text("${list[index].company!.bs}"),
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
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  viewdata(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  viewdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}

