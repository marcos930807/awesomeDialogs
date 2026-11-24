import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rive/rive.dart';

///RiveRuntimeRender
class RiveAssetAnimation extends StatefulWidget {
  ///Constructor
  const RiveAssetAnimation({
    required this.assetPath,
    required this.animName,
    Key? key,
  }) : super(key: key);

  ///Path of the .riv assets file
  final String assetPath;

  ///Name od the animation to load
  final String animName;

  @override
  State<RiveAssetAnimation> createState() => _RiveAnimationState();
}

class _RiveAnimationState extends State<RiveAssetAnimation> {
  late File? file;
  Artboard? artboard;
  late SingleAnimationPainter _painter;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      file = await File.asset(widget.assetPath, riveFactory: Factory.flutter);
      _painter = SingleAnimationPainter(widget.animName);
      artboard = file?.defaultArtboard();
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const SizedBox.shrink()
        : RiveArtboardWidget(artboard: artboard!, painter: _painter);
  }
}
