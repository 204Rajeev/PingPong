import 'package:flutter/material.dart';

class BrickInfo with ChangeNotifier {
  double brickX = 0.0;
  double l = 0, r = 0;
  double screenWidth = 0.0;

  void updateBrickX(double valX, double playerWidth) {
    brickX = valX;
    r = brickX + (playerWidth / 2 * (1 - brickX));
    l = r-playerWidth;
    notifyListeners();
  }

  void setScreeenWidth(double val) {
    screenWidth = val;
    notifyListeners();
  }
}
