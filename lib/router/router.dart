import 'package:flutter/material.dart';

class Router {
  static void push() {}

  static void pop(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
