import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Header of the [AwesomeDialog]
class AwesomeDialogHeader extends StatelessWidget {
  ///Constructor of the [AwesomeDialogHeader]
  const AwesomeDialogHeader({
    Key? key,
    required this.dialogType,
  }) : super(key: key);

  ///Defines the type of [AwesomeDialogHeader]
  final DialogType dialogType;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
      case DialogType.info:
      case DialogType.INFO_REVERSED:
      case DialogType.infoReverse:
        return SvgPicture.asset(
          'assets/icons/info.svg',
          package: 'awesome_dialog',
          width: 80,
          height: 80,
        );

      case DialogType.question:
        return SvgPicture.asset(
          'assets/icons/question.svg',
          package: 'awesome_dialog',
          width: 80,
          height: 80,
        );

      case DialogType.WARNING:
      case DialogType.warning:
        return SvgPicture.asset(
          'assets/icons/warning.svg',
          package: 'awesome_dialog',
          width: 80,
          height: 80,
        );

      case DialogType.ERROR:
      case DialogType.error:
        return SvgPicture.asset(
          'assets/icons/error.svg',
          package: 'awesome_dialog',
          width: 80,
          height: 80,
        );
      case DialogType.SUCCES:
      case DialogType.success:
        return SvgPicture.asset(
          'assets/icons/success.svg',
          package: 'awesome_dialog',
          width: 80,
          height: 80,
        );
      case DialogType.NO_HEADER:
      case DialogType.noHeader:
        return const SizedBox.shrink();
    }
  }
}
