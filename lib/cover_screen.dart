import 'package:flutter/material.dart';
import 'package:pong/score_board.dart';

class CoverScreen extends StatelessWidget {
  const CoverScreen(
      {super.key,
      required this.gameHasStarted,
      required this.enemyScore,
      required this.yourScore});
  final bool gameHasStarted;
  final int enemyScore;
  final int yourScore;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, -0.1),
        child: !gameHasStarted
            ? const Text(
                'T A P  T O  P L A Y',
                style: TextStyle(color: Colors.white),
              )
            : SizedBox(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    Text('C P U:$enemyScore'),
                    Divider(),
                    Text('Y O U:$yourScore'),
                  ],
                ),
              ));
  }
}
