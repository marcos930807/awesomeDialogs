library awesome_dialog;

import 'package:flutter/services.dart';

import 'src/anims/anims.dart';
import 'src/animated_button.dart';
import 'src/anims/flare_header.dart';
import 'src/vertical_stack_header_dialog.dart';
import 'package:flutter/material.dart';

export 'src/animated_button.dart';
export 'src/anims/flare_header.dart';
export 'src/anims/anims.dart';

enum DialogType { INFO, INFO_REVERSED, WARNING, ERROR, SUCCES, QUESTION, NO_HEADER }
enum AnimType { SCALE, LEFTSLIDE, RIGHSLIDE, BOTTOMSLIDE, TOPSLIDE }
enum DismissType { BTN_OK, BTN_CANCEL, TOP_ICON, OTHER }

class AwesomeDialog {
  /// [@required]
  final BuildContext context;

  /// Dialog Type can be INFO, WARNING, ERROR, SUCCES, NO_HEADER
  final DialogType dialogType;

  /// Widget with priority over DialogType, for a custom header widget
  final Widget? customHeader;

  /// Dialog Title
  final String? title;

  /// The [TextStyle] of the title
  ///
  /// If not set, it will be the [ThemeData.textTheme.headline6]
  final TextStyle? titleTextStyle;

  /// Set the description text of the dialog.
  final String? desc;

  /// The [TextStyle] of the description
  ///
  /// If not set, it will be the [DefaultTextStyle]
  final TextStyle? descTextStyle;

  /// Create your own Widget for body, if this property is set title and description will be ignored.
  final Widget? body;

  /// Text for the Ok button
  final String? btnOkText;

  /// Icon to use for the Ok button
  final IconData? btnOkIcon;

  /// Function to execute when Ok button is pressed
  final Function? btnOkOnPress;

  /// Color of the Ok Button
  final Color? btnOkColor;

  /// Text for the Cancel button
  final String? btnCancelText;

  /// Icon to use for the Cancel button
  final IconData? btnCancelIcon;

  /// Function to execute when Cancel button is pressed
  final Function? btnCancelOnPress;

  /// Color of the Cancel Button
  final Color? btnCancelColor;

  /// Custom Btn OK
  final Widget? btnOk;

  /// Custom Btn Cancel
  final Widget? btnCancel;

  /// Barrier Dissmisable
  final bool dismissOnTouchOutside;

  /// Callback to execute after dialog get dissmised
  final Function(DismissType type)? onDissmissCallback;

  /// Anim Type can be { SCALE, LEFTSLIDE, RIGHSLIDE, BOTTOMSLIDE, TOPSLIDE }
  final AnimType animType;

  ///Border Radius for the Dialog
  final BorderRadiusGeometry? dialogBorderRadius;

  /// Alignment of the Dialog
  final AlignmentGeometry aligment;

  /// Padding off inner content of Dialog
  final EdgeInsetsGeometry? padding;

  /// This Prop is usefull to Take advantage of screen dimensions
  final bool isDense;

  /// Whenever the animation Header loops or not.
  final bool headerAnimationLoop;

  /// To use the Rootnavigator
  final bool useRootNavigator;

  /// For Autho Hide Dialog after some Duration.
  final Duration? autoHide;

  ///Control if add or not the Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom).
  final bool keyboardAware;

  ///Control if Dialog is dissmis by back key.
  final bool dismissOnBackKeyPress;

  ///Max with of entire Dialog.
  final double? width;

  ///Border Radius for built in buttons.
  final BorderRadiusGeometry? buttonsBorderRadius;

  ///TextStyle for built in buttons.
  final TextStyle? buttonsTextStyle;

  /// Control if close icon is appear.
  final bool showCloseIcon;

  /// Custom closeIcon.
  final Widget? closeIcon;

  /// Custom background color for dialog + header
  final Color? dialogBackgroundColor;

  /// Set BorderSide of DialogShape
  final BorderSide? borderSide;

  /// Set to `false` when you want to pass data from custom [Navigator.pop]
  ///
  /// Defaults to `true`
  final bool autoDismiss;

  /// [Color] of the barrier around the dialog
  ///
  /// Defaults to `Colors.black54`
  final Color? barrierColor;

  /// If true, then hitting `Enter` key will be equivalent to clicking `Ok` button.
  ///
  /// Useful for desktop or web platforms.
  ///
  /// Defaults to `false`
  final bool enableEnterKey;

  /// Sets **gap/distance** between the top of the body and header
  /// when [dialogType] is [DialogType.NO_HEADER]
  ///
  /// Defaults to `15.0`
  final double bodyHeaderDistance;

  /// Creates a Dialog that is shown using the [showDialog] function
  ///
  /// Returns null if [autoDismiss] is true, else returns data passed to custom [Navigator.pop] function
  AwesomeDialog({
    required this.context,
    this.dialogType = DialogType.INFO,
    this.customHeader,
    this.title,
    this.titleTextStyle,
    this.desc,
    this.descTextStyle,
    this.body,
    this.btnOk,
    this.btnCancel,
    this.btnOkText,
    this.btnOkIcon,
    this.btnOkOnPress,
    this.btnOkColor,
    this.btnCancelText,
    this.btnCancelIcon,
    this.btnCancelOnPress,
    this.btnCancelColor,
    this.onDissmissCallback,
    this.isDense = false,
    this.dismissOnTouchOutside = true,
    this.headerAnimationLoop = true,
    this.aligment = Alignment.center,
    this.animType = AnimType.SCALE,
    this.padding,
    this.useRootNavigator = false,
    this.autoHide,
    this.keyboardAware = true,
    this.dismissOnBackKeyPress = true,
    this.width,
    this.dialogBorderRadius,
    this.buttonsBorderRadius,
    this.showCloseIcon = false,
    this.closeIcon,
    this.dialogBackgroundColor,
    this.borderSide,
    this.buttonsTextStyle,
    this.autoDismiss = true,
    this.barrierColor = Colors.black54,
    this.enableEnterKey = false,
    this.bodyHeaderDistance = 15.0,
  }) : assert(
          autoDismiss || onDissmissCallback != null,
          "If autoDismiss is false, you must provide an onDissmissCallback to pop the dialog",
        );

  /// The type for dismissal of the dialog
  DismissType _dismissType = DismissType.OTHER;

  /// Used to call the `onDissmissCallback` if dialog
  /// is popped using custom [Navigator.pop] method.
  bool _onDissmissCallbackCalled = false;

  /// Shows the dialog using the [showDialog] function
  ///
  /// Returns `null` if [autoDismiss] is true, else returns data passed to custom [Navigator.pop] function
  Future show() => showDialog(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierDismissible: dismissOnTouchOutside,
        barrierColor: barrierColor,
        builder: (BuildContext context) {
          if (autoHide != null) {
            Future.delayed(autoHide!).then((value) => dismiss());
          }
          switch (animType) {
            case AnimType.SCALE:
              return ScaleFade(
                scale: 0.1,
                fade: true,
                curve: Curves.fastLinearToSlowEaseIn,
                child: _buildDialog,
              );

            case AnimType.LEFTSLIDE:
              return FadeIn(from: SlideFrom.LEFT, child: _buildDialog);

            case AnimType.RIGHSLIDE:
              return FadeIn(from: SlideFrom.RIGHT, child: _buildDialog);

            case AnimType.BOTTOMSLIDE:
              return FadeIn(from: SlideFrom.BOTTOM, child: _buildDialog);

            case AnimType.TOPSLIDE:
              return FadeIn(from: SlideFrom.TOP, child: _buildDialog);

            default:
              return _buildDialog;
          }
        },
      )..then(
          (value) => _onDissmissCallbackCalled ? null : onDissmissCallback?.call(_dismissType),
        );

  /// Return the header of the dialog
  Widget? get _buildHeader {
    if (customHeader != null) return customHeader;
    if (dialogType == DialogType.NO_HEADER) return null;
    return FlareHeader(
      loop: headerAnimationLoop,
      dialogType: dialogType,
    );
  }

  /// Returns the body of the dialog
  Widget get _buildDialog => WillPopScope(
        onWillPop: _onWillPop,
        child: _getDialogWidget(
          child: VerticalStackDialog(
            dialogBackgroundColor: dialogBackgroundColor,
            borderSide: borderSide,
            borderRadius: dialogBorderRadius,
            header: _buildHeader,
            title: title,
            titleStyle: titleTextStyle,
            desc: desc,
            descStyle: descTextStyle,
            body: body,
            isDense: isDense,
            alignment: aligment,
            keyboardAware: keyboardAware,
            width: width,
            padding: padding ?? const EdgeInsets.only(left: 5, right: 5),
            bodyHeaderDistance: bodyHeaderDistance,
            btnOk: btnOk ?? (btnOkOnPress != null ? _buildFancyButtonOk : null),
            btnCancel: btnCancel ?? (btnCancelOnPress != null ? _buildFancyButtonCancel : null),
            showCloseIcon: showCloseIcon,
            onClose: () {
              _dismissType = DismissType.TOP_ICON;
              dismiss.call();
            },
            closeIcon: closeIcon,
          ),
        ),
      );

  Widget _getDialogWidget({required Widget child}) {
    return enableEnterKey
        ? RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (event) {
              if (event.isKeyPressed(LogicalKeyboardKey.enter) ||
                  event.isKeyPressed(LogicalKeyboardKey.numpadEnter)) {
                if (btnOk == null && btnOkOnPress != null) {
                  _dismissType = DismissType.BTN_OK;
                  dismiss();
                  btnOkOnPress?.call();
                }
              }
            },
            child: child,
          )
        : child;
  }

  /// Returns the default `Ok Button` widget
  Widget get _buildFancyButtonOk => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          _dismissType = DismissType.BTN_OK;
          dismiss();
          btnOkOnPress?.call();
        },
        text: btnOkText ?? 'Ok',
        color: btnOkColor ?? const Color(0xFF00CA71),
        icon: btnOkIcon,
        borderRadius: buttonsBorderRadius,
        buttonTextStyle: buttonsTextStyle,
      );

  /// Returns the default `Cancel Button` widget
  Widget get _buildFancyButtonCancel => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          _dismissType = DismissType.BTN_CANCEL;
          dismiss();
          btnCancelOnPress?.call();
        },
        text: btnCancelText ?? 'Cancel',
        color: btnCancelColor ?? Colors.red,
        icon: btnCancelIcon,
        borderRadius: buttonsBorderRadius,
        buttonTextStyle: buttonsTextStyle,
      );

  /// Called to dismiss the dialog using the [Navigator.pop] method
  /// or calls the [onDissmissCallback] function if [autoDismiss] is `false`
  void dismiss() {
    if (autoDismiss) {
      Navigator.of(context, rootNavigator: useRootNavigator).pop();
    }
    onDissmissCallback?.call(_dismissType);
    _onDissmissCallbackCalled = true;
  }

  /// Executes when `back button` pressed or `barrier dismissed`
  Future<bool> _onWillPop() async {
    if (dismissOnBackKeyPress) {
      _dismissType = DismissType.OTHER;
      dismiss();
    }
    return dismissOnBackKeyPress;
  }
}
