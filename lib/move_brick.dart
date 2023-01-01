import 'dart:math';

import 'package:flutter/material.dart';


class MoveBrick extends StatefulWidget {
  MoveBrick({super.key, required this.childWidget});

  final Widget childWidget;

  @override
  State<MoveBrick> createState() => _MoveBrickState();
}

class _MoveBrickState extends State<MoveBrick> {
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _left,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            _left = _left + details.delta.dx;
          });
        },
        child: widget.childWidget,
      ),
    );
  }
}
