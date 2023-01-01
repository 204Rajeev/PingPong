import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final yourScore;
  final cpuScore;
  const ScoreBoard({super.key, this.yourScore, this.cpuScore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Column(
        children: [
          Text('C P U:$cpuScore'),
          Divider(),
          Text('Y O U:$yourScore'),
        ],
      ),
    );
  }
}
