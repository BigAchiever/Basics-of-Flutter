import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {

  final size;

  const MyBarrier({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: size,
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(width: 8, color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(18)
      ),
    );
  }
}
