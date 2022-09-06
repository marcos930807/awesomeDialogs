import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAssetAnimation extends StatefulWidget {
  const RiveAssetAnimation({
    Key? key,
    required this.assetPath,
    required this.animName,
  }) : super(key: key);

  final String assetPath;
  final String animName;
  @override
  State<RiveAssetAnimation> createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAssetAnimation> {
  // Controller for playback
  late RiveAnimationController<dynamic> _controller;

  @override
  void initState() {
    super.initState();

    _controller = SimpleAnimation(widget.animName);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      widget.assetPath,
      controllers: [_controller],
    );
  }
}
