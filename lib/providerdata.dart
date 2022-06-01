import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class providerdata1 with ChangeNotifier{

  
  viewdata? view;
  bool status=false;


  void getHttp() async {

    try {
      var response = await Dio().get('https://fakestoreapi.com/products/1');
      print(response);

      var vv=jsonDecode(response.toString());
      view=viewdata.fromJson(vv);
      status=true;
      notifyListeners();


    } catch (e) {
      print(e);
      notifyListeners();
    }


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
