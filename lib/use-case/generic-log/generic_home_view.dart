import 'package:flutter/material.dart';
import 'package:vb10_use_case/use-case/generic-log/core/logger_mixin.dart';
import 'package:vb10_use_case/use-case/generic-log/generic_home_detail_view.dart';

class GenericHomeView extends StatefulWidget {
  const GenericHomeView({super.key});

  @override
  State<GenericHomeView> createState() => _GenericHomeViewState();
}

class _GenericHomeViewState extends State<GenericHomeView> with LoggerMixin {
  final _kEight = 8;

  @override
  PageSpecialKeys key = PageSpecialKeys.home;

  @override
  CustomModel model = CustomModel(description: 'This is the HomeView');

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _kEight,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(index.toString()),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GenericHomeDetailView(id: index.toString()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
