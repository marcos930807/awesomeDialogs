import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/src/anims/rive_anim.dart';
import 'package:flutter/material.dart';

///Header of the [AwesomeDialog]
class AwesomeDialogHeader extends StatelessWidget {
  ///Constructor of the [AwesomeDialogHeader]
  const AwesomeDialogHeader({
    required this.dialogType, required this.loop, Key? key,
  }) : super(key: key);

  ///Defines the type of [AwesomeDialogHeader]
  final DialogType dialogType;

  ///Defines if the animation loops or not
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
      case DialogType.info:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.INFO_REVERSED:
      case DialogType.infoReverse:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/info_reverse.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.question:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/question.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.WARNING:
      case DialogType.warning:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/warning.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );

      case DialogType.ERROR:
      case DialogType.error:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/error.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.SUCCES:
      case DialogType.success:
        return RiveAssetAnimation(
          assetPath: 'packages/awesome_dialog/assets/rive/success.riv',
          animName: loop ? 'appear_loop' : 'appear',
        );
      case DialogType.NO_HEADER:
      case DialogType.noHeader:
        return const SizedBox.shrink();
    }
  }
}
