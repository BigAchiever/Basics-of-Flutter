import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int days = 30;
    String name = "Danish Ali Siddiqui";
    var day = "Tuesday";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("My name is $name learning flutter in $days days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
