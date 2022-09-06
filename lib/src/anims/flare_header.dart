import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../awesome_dialog.dart';
import 'rive_anim.dart';

class FlareHeader extends StatelessWidget {
  const FlareHeader({
    Key? key,
    required this.dialogType,
    required this.loop,
  }) : super(key: key);

  final DialogType dialogType;
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.INFO_REVERSED:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info_reverse.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.QUESTION:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/question.flr',
          fit: BoxFit.cover,
          animation: loop ? 'anim_loop' : 'anim',
          callback: (String call) {},
        );
      case DialogType.WARNING:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/warning.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.ERROR:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/error.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.SUCCES:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/success.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
