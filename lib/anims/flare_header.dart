import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';



class FlareHeader extends StatelessWidget {
  const FlareHeader({Key key, @required this.dialogType}) : super(key: key);
  final DialogType dialogType;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
        return FlareActor(
          "packages/fancy_dialog/assets/flare/info.flr",
          
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
        break;
      case DialogType.WARNING:
        return FlareActor(
          "packages/fancy_dialog/assets/flare/warning.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
        break;
      case DialogType.ERROR:
        return FlareActor(
          "packages/fancy_dialog/assets/flare/error.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Error',
        );
        break;
      case DialogType.SUCCES:
        return FlareActor(
          "packages/fancy_dialog/assets/flare/succes.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Untitled',
        );
        break;
      default:
    }
    
  }
}
