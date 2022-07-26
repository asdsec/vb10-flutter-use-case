import 'package:flutter/material.dart';
import 'package:vb10_use_case/use-case/generic-log/core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  const GenericHomeDetailView({super.key, required this.id});

  final String id;

  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with LoggerMixin {
  final _customModelDescription = 'this is a detail page';

  @override
  PageSpecialKeys get key => PageSpecialKeys.detail;

  @override
  CustomModel get model => CustomModel(id: widget.id, description: _customModelDescription);

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(widget.id)),
    );
  }
}
