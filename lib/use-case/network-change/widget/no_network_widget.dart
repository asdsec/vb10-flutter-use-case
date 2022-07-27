import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vb10_use_case/use-case/network-change/manager/network_change_manager.dart';

import '../state_mixin.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final INetworkChangeManager _networkChangeManager;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChangeManager = NetworkChangeManager();
    waitForScreenDraw(() {
      _networkChangeManager.handleNetworkChange((result) {
        updateView(result);
      });
    });
  }

  void fetchFirstResult() {
    waitForScreenDraw(() async {
      final result = await _networkChangeManager.checkNetworkFirstTime();
      updateView(result);
    });
  }

  void updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: context.durationLow,
      crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        height: context.dynamicHeight(.1),
        color: context.colorScheme.onError,
      ),
      secondChild: const SizedBox.shrink(),
    );
  }
}
