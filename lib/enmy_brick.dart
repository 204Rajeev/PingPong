import 'package:flutter/material.dart';

class EnemyBrick extends StatefulWidget {
  final xVal;
  final playerWidth;
  const EnemyBrick({super.key, this.xVal, this.playerWidth});

  @override
  State<EnemyBrick> createState() => _EnemyBrickState();
}

class _EnemyBrickState extends State<EnemyBrick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(widget.xVal, -0.9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          height: 10,
          width: widget.playerWidth * MediaQuery.of(context).size.width / 2,
          //child: Text(MediaQuery.of(context).size.width.toString()),
        ),
      ),
    );
  }
}
