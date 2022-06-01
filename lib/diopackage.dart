
import 'package:flutter/material.dart';
import 'package:getapi/main.dart';
import 'package:getapi/providerdata.dart';
import 'package:provider/provider.dart';

import 'providerdata.dart';

class dioo extends StatefulWidget {
  const dioo({Key? key}) : super(key: key);

  @override
  State<dioo> createState() => _diooState();
}

class _diooState extends State<dioo> {

   final providerdata1 provider = providerdata1();

   @override
  void initState() {
    // TODO: implement initState
    provider.getHttp();
    super.initState();
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
      appBar: AppBar(title: Text("Dio"), backgroundColor: Colors.black),
      body:ChangeNotifierProvider<providerdata1>(create: (context) =>
          provider,child: Consumer<providerdata1>(builder: (context, provider, child) {
        return provider.status? WillPopScope(
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
                        // border: Border.all(width: 1),
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage("${provider.view!.image}"),
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
                                        text: "${provider.view!.title}",
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
                                        text: "${provider.view!.price.toString()}",
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
                                        text: "${provider.view!.description}",
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
                                        text: "${provider.view!.category}",
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
                                        text: "${provider.view!.rating!.rate.toString()}",
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
                                        text: "${provider.view!.rating!.count}",
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
        ):Center(child: CircularProgressIndicator());
      },),)
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

