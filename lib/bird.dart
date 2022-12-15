import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  final birdy;

  const MyBird({super.key, this.birdy});


  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment(0, birdy),

      child: Image.asset("lib/images/flappybird.png",width: 50,),
    );
  }
}
