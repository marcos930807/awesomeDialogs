import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

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
      case DialogType.info:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/info2.flr',
          fit: BoxFit.cover,
          animation: loop ? 'appear_loop' : 'appear',
          callback: (String call) {},
        );
      case DialogType.infoReversed:
        return FlareActor(
          loop
              ? 'packages/awesome_dialog/assets/flare/info.flr'
              : 'packages/awesome_dialog/assets/flare/info_without_loop.flr',
          fit: BoxFit.cover,
          animation: 'appear',
        );
      case DialogType.question:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/question.flr',
          fit: BoxFit.cover,
          animation: loop ? 'anim_loop' : 'anim',
          callback: (String call) {},
        );
      case DialogType.warning:
        return FlareActor(
          loop
              ? 'packages/awesome_dialog/assets/flare/warning.flr'
              : 'packages/awesome_dialog/assets/flare/warning_without_loop.flr',
          fit: BoxFit.cover,
          animation: 'appear',
        );
      case DialogType.error:
        return FlareActor(
          'packages/awesome_dialog/assets/flare/error.flr',
          fit: BoxFit.fill,
          animation: loop ? 'Error' : 'Error_no_loop',
        );
      case DialogType.success:
        return FlareActor(
          loop
              ? 'packages/awesome_dialog/assets/flare/success.flr'
              : 'packages/awesome_dialog/assets/flare/success_without_loop.flr',
          fit: BoxFit.fill,
          animation: 'Untitled',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
