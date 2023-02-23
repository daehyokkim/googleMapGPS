import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Test Main Page"),
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(22),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: []),
      ),
    );
  }
}
