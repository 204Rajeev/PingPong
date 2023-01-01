import 'package:flutter/material.dart';

class MyBall extends StatefulWidget {
  const MyBall({super.key, this.x, this.y, this.radius});
  final x;
  final y;
  final radius;

  @override
  State<MyBall> createState() => _MyBallState();
}

class _MyBallState extends State<MyBall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(widget.x, widget.y),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        height: widget.radius * MediaQuery.of(context).size.width / 2,
        width: widget.radius * MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
