import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pong/ball.dart';
import 'package:pong/brick.dart';
import 'package:pong/cover_screen.dart';
import 'package:pong/enmy_brick.dart';
import 'package:pong/provider/brick_info.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction {
  UP,
  DOWN,
  LEFT,
  RIGHT,
}

class _HomePageState extends State<HomePage> {
  // ball variables
  double ballX = 0.0;
  double ballY = 0.0;
  double ballMid = 0.0;
  double ballL = 0.0;
  double ballR = 0.0;
  var ballYDirecton;
  var ballXDirection;
  //player variables
  double playerX = 0, l = 0, r = 0;
  double playerWidth = 0.4; //out of 2
  double ballSize = 0.1; //out of 2
  double horFac =
      1.0; //it is factor to move the ball in the horizontal direction

  //game settings
  bool gameHasStarted = false;
  int yourScore = 0;
  int cpuScore = 0;

  void startGame() {
    gameHasStarted = true;
    ballYDirecton = direction.DOWN;
    ballXDirection = direction.RIGHT;
    ballR = ballX + (ballSize / 2 * (1 - ballX));
    ballL = ballR - ballSize;
    ballMid = (ballL + ballR) / 2;
    horFac = 3.0;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      //update direction
      updateDirection();

      //moveBall
      moveBall();

      if (isPlayerDead()) {
        timer.cancel();
        resetGame();
      }
    });
  }

  void resetGame() {
    setState(() {
      gameHasStarted = false;
      ballX = 0;
      ballY = 0;
    });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      cpuScore++;
      return true;
    }
    return false;
  }

  double abs(double a, double b) {
    if (a >= b) {
      return a - b;
    } else {
      return b - a;
    }
  }

  void updateDirection() {
    setState(() {
      final data = Provider.of<BrickInfo>(context, listen: false);
      playerX = data.brickX;
      l = data.l;
      r = data.r;
      ballR = ballX + (ballSize / 2 * (1 - ballX));
      ballL = ballR - ballSize;
      ballMid = (ballL + ballR) / 2;

      //update verticle direction also horizontal direction
      if (ballY >= 0.9 && ballX >= l - ballSize && ballX <= r + ballSize) {
        ballYDirecton = direction.UP;
        horFac = 10 * abs(ballMid, (l + r) / 2);
        if (ballMid > (l + r) / 2) {
          ballXDirection = direction.RIGHT;
        } else if (ballMid < (l + r) / 2) {
          ballXDirection = direction.LEFT;
        }
      } else if (ballY <= -0.9) {
        ballYDirecton = direction.DOWN;
      }

      //update horizontal direction

      if (ballX >= 1) {
        ballXDirection = direction.LEFT;
        print('Go Left');
        //ballX -= 0.01 * horFac;
      } else if (ballX <= -1) {
        ballXDirection = direction.RIGHT;
        //ballX += 0.01 * horFac;
      }

      // moveBall();
    });
  }

  void moveBall() {
    setState(() {
      if (ballYDirecton == direction.DOWN) {
        ballY += 0.005;
      }
      if (ballYDirecton == direction.UP) {
        ballY -= 0.005;
      }

      if (ballXDirection == direction.RIGHT) {
        //print(
           // 'iam make the ball move right______________________________________________________________:$ballX and the horFac:$horFac');
        ballX += 0.005 * horFac;
      }
      if (ballXDirection == direction.LEFT) {
        // print(
        //     'iam make the ball move left______________________________________________________________:$ballX and the horFac:$horFac');
        ballX -= 0.005 * horFac;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<BrickInfo>(context, listen: true);
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Stack(children: [
            //tap to play
            CoverScreen(
              gameHasStarted: gameHasStarted,
              yourScore: yourScore,
              enemyScore: cpuScore,
            ),

            //top brick
            EnemyBrick(
              xVal: ballMid,
              playerWidth: playerWidth,
            ),

            //bottom brick
            MyBrick(
              y: 0.9,
              playerWidth: playerWidth,
            ),

            //ball
            MyBall(
              x: ballX,
              y: ballY,
              radius: ballSize,
            ),
          ]),
        ),
      ),
    );
  }
}
