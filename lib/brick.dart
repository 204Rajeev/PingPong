import 'package:flutter/material.dart';
import 'package:pong/move_brick.dart';
import 'package:pong/provider/brick_info.dart';
import 'package:provider/provider.dart';

class MyBrick extends StatefulWidget {
  final double y;
  final double playerWidth;
  MyBrick({super.key, required this.y, required this.playerWidth});

  @override
  State<MyBrick> createState() => _MyBrickState();
}

class _MyBrickState extends State<MyBrick> {
  double xAxis = 0.0, xVal = 0.0;

  void printSize(String s) {
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    final add = Provider.of<BrickInfo>(context);
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            xAxis = xAxis + details.delta.dx;
            if (xAxis / 100 > 1) xAxis = 100;
            if (xAxis / 100 < -1) xAxis = -100;
            xVal = xAxis / 100;
            add.updateBrickX(xVal,widget.playerWidth);
            //print(xVal);
          });
          add.setScreeenWidth(MediaQuery.of(context).size.width);
        },
        child: Container(
          alignment: Alignment(xVal, widget.y),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              height: 10,
              width: widget.playerWidth * MediaQuery.of(context).size.width / 2,
              //child: Text(MediaQuery.of(context).size.width.toString()),
            ),
          ),
        ));
  }
}
