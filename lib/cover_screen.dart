import 'package:flutter/material.dart';

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
    return Center(
        child: !gameHasStarted
            ? const Text(
                'T A P   T         P L A Y',
                style: TextStyle(color: Colors.white),
              )
            : Container(
                height: 200,
                width: 100,
                child: Column(
                  children: [
                    Text('E N E M Y : $enemyScore',
                        style: TextStyle(color: Colors.white)),
                    const Divider(
                      color: Colors.white,
                    ),
                    Text('Y O U R : $yourScore',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ));
  }
}
