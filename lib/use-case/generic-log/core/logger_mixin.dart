import 'package:flutter/material.dart';
import 'package:vb10_use_case/use-case/generic-log/core/project_logger.dart';

mixin LoggerMixin<T extends StatefulWidget> on State<T> {
  PageSpecialKeys get key;
  CustomModel get model;

  void init();

  @override
  void initState() {
    super.initState();
    ProjectCustomLog.instance.logClassName(this);
    ProjectCustomLog.instance.logPageName(key);
    ProjectCustomLog.instance.logCustomModel(model);
    init();
  }
}

enum PageSpecialKeys { home, detail }

class CustomModel {
  final String? id;
  final String? description;

  CustomModel({this.id, this.description});
}
