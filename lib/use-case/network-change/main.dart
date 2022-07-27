import 'package:flutter/material.dart';

import 'core/init/main_build.dart';
import 'view/network_change_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final _kTitle = 'Network Change Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _kTitle,
      theme: ThemeData.dark().copyWith(),
      builder: MainBuild.build,
      home: const NetworkChangeView(),
    );
  }
}
