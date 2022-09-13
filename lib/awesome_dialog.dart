library awesome_dialog;

import 'package:awesome_dialog/src/animated_button.dart';
import 'package:awesome_dialog/src/anims/native_animations.dart';
import 'package:awesome_dialog/src/header.dart';
import 'package:awesome_dialog/src/vertical_stack_header_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'src/animated_button.dart';
export 'src/anims/native_animations.dart';
export 'src/header.dart';

///Main class for creating a dialog
class AwesomeDialog {
  ///Constructor
  AwesomeDialog(
      {required this.context,
      this.dialogType = DialogType.info,
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
      this.onDismissCallback,
      this.isDense = false,
      this.dismissOnTouchOutside = true,
      this.headerAnimationLoop = true,
      this.alignment = Alignment.center,
      this.animType = AnimType.scale,
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
      this.reverseBtnOrder = false,
      this.transitionAnimationDuration = const Duration(milliseconds: 300)})
      : assert(
          autoDismiss || onDismissCallback != null,
          'If autoDismiss is false, you must provide an onDismissCallback to pop the dialog',
        );

  /// [@required]
  final BuildContext context;

  /// Dialog Type can be info, warning, error, success, noHeader
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
  final void Function()? btnOkOnPress;

  /// Color of the Ok Button
  final Color? btnOkColor;

  /// Text for the Cancel button
  final String? btnCancelText;

  /// Icon to use for the Cancel button
  final IconData? btnCancelIcon;

  /// Function to execute when Cancel button is pressed
  final void Function()? btnCancelOnPress;

  /// Color of the Cancel Button
  final Color? btnCancelColor;

  /// Custom Btn OK
  final Widget? btnOk;

  /// Custom Btn Cancel
  final Widget? btnCancel;

  /// Barrier Dismissible
  final bool dismissOnTouchOutside;

  /// Callback to execute after dialog get dismissed
  final void Function(DismissType type)? onDismissCallback;

  /// Anim Type can be { scale, leftSlide, rightSlide, bottomSlide, topSlide }
  final AnimType animType;

  ///Border Radius for the Dialog
  final BorderRadiusGeometry? dialogBorderRadius;

  /// Alignment of the Dialog
  final AlignmentGeometry alignment;

  /// Padding off inner content of Dialog
  final EdgeInsetsGeometry? padding;

  /// This Prop is usefull to Take advantage of screen dimensions
  final bool isDense;

  /// Whenever the animation Header loops or not.
  final bool headerAnimationLoop;

  /// To use the Rootnavigator
  final bool useRootNavigator;

  /// For Auto Hide Dialog after some Duration.
  final Duration? autoHide;

  ///Control if add or not the Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom).
  final bool keyboardAware;

  ///Control if Dialog is dismiss by back key.
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
  /// when [dialogType] is [DialogType.noHeader]
  ///
  /// Defaults to `15.0`
  final double bodyHeaderDistance;

  /// Used to make Ok button appear First than Cancel.
  ///
  /// Initialized to `false`
  bool reverseBtnOrder;

  /// Duration of the transition animation
  Duration transitionAnimationDuration;

  /// Creates a Dialog that is shown using the [showDialog] function
  ///
  /// Returns null if [autoDismiss] is true, else returns data passed to custom [Navigator.pop] function

  /// The type for dismissal of the dialog
  DismissType _dismissType = DismissType.other;

  /// Used to check if the [onDismissCallback] is called. (also to see if dialog is popped)
  ///
  /// Initialized to `false`
  bool _onDismissCallbackCalled = false;

  /// Shows the dialog using the [showGeneralDialog] function
  ///
  /// Returns `null` if [autoDismiss] is true, else returns data passed to custom [Navigator.pop] function
  Future<dynamic> show() => showGeneralDialog(
        context: context,
        useRootNavigator: useRootNavigator,
        barrierDismissible: dismissOnTouchOutside,
        pageBuilder: (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          if (autoHide != null) {
            Future<dynamic>.delayed(autoHide!).then((dynamic _) {
              _dismissType = DismissType.autoHide;
              dismiss();
            });
          }
          return _buildDialog;
        },
        transitionDuration: transitionAnimationDuration,
        transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            _showAnimation(animation, secondaryAnimation, child),
        barrierColor: barrierColor ?? const Color(0x80000000),
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
      )..then<dynamic>(
          (dynamic value) => _onDismissCallbackCalled
              ? null
              : onDismissCallback?.call(_dismissType),
        );

  /// Return the header of the dialog
  Widget? get _buildHeader {
    if (customHeader != null) {
      return customHeader;
    }
    if (dialogType == DialogType.NO_HEADER ||
        dialogType == DialogType.noHeader) {
      return null;
    }
    return AwesomeDialogHeader(
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
            alignment: alignment,
            keyboardAware: keyboardAware,
            width: width,
            padding: padding ?? const EdgeInsets.only(left: 5, right: 5),
            bodyHeaderDistance: bodyHeaderDistance,
            btnOk: btnOk ?? (btnOkOnPress != null ? _buildFancyButtonOk : null),
            btnCancel: btnCancel ??
                (btnCancelOnPress != null ? _buildFancyButtonCancel : null),
            showCloseIcon: showCloseIcon,
            onClose: () {
              _dismissType = DismissType.topIcon;
              dismiss.call();
            },
            closeIcon: closeIcon,
            reverseBtnOrder: reverseBtnOrder,
          ),
        ),
      );

  Widget _getDialogWidget({
    required Widget child,
  }) {
    return enableEnterKey
        ? RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (RawKeyEvent event) {
              if (event.isKeyPressed(LogicalKeyboardKey.enter) ||
                  event.isKeyPressed(LogicalKeyboardKey.numpadEnter)) {
                if (btnOk == null && btnOkOnPress != null) {
                  _dismissType = DismissType.btnOk;
                  dismiss();
                  btnOkOnPress?.call();
                }
              }
            },
            child: child,
          )
        : child;
  }

  /// Shows alert with selected animation
  Widget _showAnimation(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    switch (animType) {
      case AnimType.RIGHSLIDE:
      case AnimType.rightSlide:
        return AnimationTransition.fromRight(
          animation,
          secondaryAnimation,
          child,
        );
      case AnimType.LEFTSLIDE:
      case AnimType.leftSlide:
        return AnimationTransition.fromLeft(
          animation,
          secondaryAnimation,
          child,
        );
      case AnimType.TOPSLIDE:
      case AnimType.topSlide:
        return AnimationTransition.fromTop(
          animation,
          secondaryAnimation,
          child,
        );
      case AnimType.BOTTOMSLIDE:
      case AnimType.bottomSlide:
        return AnimationTransition.fromBottom(
          animation,
          secondaryAnimation,
          child,
        );
      case AnimType.SCALE:
      case AnimType.scale:
        return AnimationTransition.scale(
          animation,
          secondaryAnimation,
          child,
        );
    }
  }

  /// Returns the default `Ok Button` widget
  Widget get _buildFancyButtonOk => AnimatedButton(
        isFixedHeight: false,
        pressEvent: () {
          _dismissType = DismissType.btnOk;
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
          _dismissType = DismissType.btnCancel;
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
  /// or calls the [onDismissCallback] function if [autoDismiss] is `false`
  void dismiss() {
    if (_onDismissCallbackCalled) return;
    if (autoDismiss) {
      Navigator.of(context, rootNavigator: useRootNavigator).pop();
    }
    onDismissCallback?.call(_dismissType);
    _onDismissCallbackCalled = true;
  }

  /// Executes when `back button` pressed or `barrier dismissed`
  Future<bool> _onWillPop() async {
    //Determine whenever the dismiss is from Modal Barrier or BackButton
    if (StackTrace.current.toString().contains('ModalBarrier')) {
      if (dismissOnTouchOutside) {
        _dismissType = DismissType.modalBarrier;
        dismiss();
      }
    } else if (dismissOnBackKeyPress) {
      //BackButton
      _dismissType = DismissType.androidBackButton;
      dismiss();
    }

    return false;
  }
}

///Defines the header of [AwesomeDialog]
enum DialogType {
  @Deprecated("Use effective dart version 'info' ")

  ///Dialog with information type header
  INFO,

  ///Dialog with information type header
  info,

  ///Dialog with information type header rotated 180 degree
  @Deprecated("Use effective dart version 'infoReverse' ")
  INFO_REVERSED,

  ///Dialog with information type header rotated 180 degree
  infoReverse,

  ///Dialog with warning amber type header
  @Deprecated("Use effective dart version 'warning' ")
  WARNING,

  ///Dialog with warning amber type header
  warning,

  ///Dialog with error red type header
  @Deprecated("Use effective dart version 'error' ")
  ERROR,

  ///Dialog with error red type header
  error,

  ///Dialog with success green type header
  @Deprecated("Use effective dart version 'success' ")
  SUCCES,

  ///Dialog with success green type header
  success,

  @Deprecated("Use effective dart version 'noHeader' ")

  ///Dialog without a header
  NO_HEADER,

  ///Dialog without a header
  noHeader
}

///Defines dismiss type of [AwesomeDialog]
enum DismissType {
  ///When dismissed by pressing BtnOk
  btnOk,

  ///When dismissed by pressing BtnCancel
  btnCancel,

  ///When dismissed by pressing top right corner icon
  topIcon,

  ///When dismissed by pressing the modal barrier
  modalBarrier,

  ///When dismissed by pressing the android native back button
  androidBackButton,

  ///When dismissed by AutoHide functionality
  autoHide,

  ///Other unknown
  other,
}
