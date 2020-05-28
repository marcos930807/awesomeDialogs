import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareHeader extends StatelessWidget {
  const FlareHeader({Key key, @required this.dialogType, @required this.loop})
      : super(key: key);
  final DialogType dialogType;
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
        return FlareActor(
          loop
              ? "packages/awesome_dialog/assets/flare/info.flr"
              : "packages/awesome_dialog/assets/flare/info_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
          callback: (call) {},
        );
        break;
      case DialogType.WARNING:
        return FlareActor(
          loop
              ? "packages/awesome_dialog/assets/flare/warning.flr"
              : "packages/awesome_dialog/assets/flare/warning_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
        break;
      case DialogType.ERROR:
        return FlareActor(
          loop
              ? "packages/awesome_dialog/assets/flare/error.flr"
              : "packages/awesome_dialog/assets/flare/error_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Error',
        );
        break;
      case DialogType.SUCCES:
        return FlareActor(
          loop
              ? "packages/awesome_dialog/assets/flare/succes.flr"
              : "packages/awesome_dialog/assets/flare/succes_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Untitled',
        );
        break;
      default:
        return FlareActor(
          loop
              ? "packages/awesome_dialog/assets/flare/info.flr"
              : "packages/awesome_dialog/assets/flare/info_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
    }
  }
}
