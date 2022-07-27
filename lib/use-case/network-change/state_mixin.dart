import 'package:flutter/material.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreenDraw(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}
