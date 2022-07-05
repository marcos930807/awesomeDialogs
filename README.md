# awesome_dialog

A new Flutter package project for simple and awesome dialogs

## Usage

To use this package, add awesome_dialog as a dependency in your pubspec.yaml file.
And add this import to your file.

import 'package:awesome_dialog/awesome_dialog.dart';

## Demo
Check out <https://cv.toranzo.dev/awesome-dialog> for more fun.
## Image
![alt text](doc/gif.gif)

### Example

```dart
AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
```
## Custom Body

If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.

```dart
AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            body: Center(child: Text(
                    'If the body is specified, then title and description will be ignored, this allows to 											further customize the dialogue.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),),
            title: 'This is Ignored',
            desc:   'This is also Ignored',
            btnOkOnPress: () {},
            )..show();
```

## Custom Button

To use custom buttons, just specify the buttonOk or btnCancel widget, all text parameters icon etc will be ignored.

## Dissmiss and Callback

AwesomeDialog has onDissmissCallback() and can be dissmissed at any time using dissmiss() public method.

### AwesomeDialog Class

| Dart attribute        | Datatype             | Description                                                                                                                                                   |             Default Value              |
|:---------------------:|:--------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------:|
| dialogType            | DialogType           | Set DialogType example: DialogType.INFO, this create an animated Header.                                                                                      |                  Null                  |
| customHeader          | Widget               | Create your own header(if this is set DiaologType is ignored.)                                                                                                |                  Null                  |
| width                 | double               | The maximum width of the dialog, especially useful in web flutter, or landscape mode                                                                          |   MediaQuery.of(context).size.width.   |
| title                 | String               | Set the title of dialog.                                                                                                                                      |                  Null                  |
| desc                  | String               | Set the description text of the dialog.                                                                                                                       |                  Null                  |
| body                  | Widget               | Create your own Widget for body, if this property is set title and description will be ignored.                                                               |                  Null                  |
| context               | BuildContext         | @required                                                                                                                                                     |                  Null                  |
| btnOkText             | String               | Text of positive button                                                                                                                                       |                  'Ok'                  |
| btnOkIcon             | IconData             | Icon of positive button                                                                                                                                       |                  Null                  |
| btnOkOnPress          | Function             | Function that handle click of positive Button, closing the dialog is handled internally.                                                                       |                  Null                  |
| btnOkColor            | Color                | Color of positive Button                                                                                                                                       |           Color(0xFF00CA71)            |
| btnOk                 | Widget               | Allows to create a custom button, if this property is different from null then btnOkText, btnOkIcon, btnOkOnPress, btnOkColor will be ignored                 |                  null                  |
| btnCancelText         | String               | Text of negative button                                                                                                                                       |                'Cancel'                |
| btnCancelIcon         | IconData             | Icon of negative button                                                                                                                                       |                  Null                  |
| btnCancelOnPress      | Function             | Function that handle click of negative Button, closing the dialog is handled internally.                                                                      |                  Null                  |
| btnCancelColor        | Color                | Color of negative Button                                                                                                                                      |               Colors.red               |
| btnCancel             | Widget               | Allows to create a custom button, if this property is different from null then btnCancelText, btnCancelIcon, btnCancelOnPress, btnCancelColor will be ignored |                  null                  |
| buttonsBorderRadius   | BorderRadiusGeometry | Allows to customize buttons border radius                                                                                                                     | BorderRadius.all(Radius.circular(100)) |
| dismissOnTouchOutside | bool                 | Dismiss dialog on touch overlay                                                                                                                              |                  true                  |
| onDismissCallback    | Function             | Dismiss callback function                                                                                                                                     |                  Null                  |
| animType              | AnimType             | Type of dialogue enter animation                                                                                                                              |             AnimType.SCALE             |
| alignment              | AlignmentGeometry    | dialogue alignment gravity                                                                                                                                     |            Alignment.center            |
| useRootNavigator      | bool                 | Use the root navigator instead than the local. This is useful when the default cancel go to the previous screen instead to just close the dialog               |                 false                  |
| headerAnimationLoop   | bool                 | headerAnimationLoop control the loop for animation header                                                                                                     |                  true                  |
| padding               | EdgeInsetsGeometry   | The padding of dialog elements                                                                                                                                 |  EdgeInsets.only(left: 5, right: 5),   |
| autoHide              | Duration             | Hide the Dialog after this Duration                                                                                                                           |                  null                  |
| keyboardAware         | bool                 | Control if add or not the Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom).                                                          |                  true                  |
| dismissOnBackKeyPress | bool                 | control if AwesomeDialog is dismissible by back button.                                                                                                       |                  true                  |
| buttonsBorderRadius | BorderRadiusGeometry                 | Border Radius for built in buttons.                                                                                       |                  BorderRadius.all(Radius.circular(100)                  |
| buttonsTextStyle | TextStyle                 | TextStyle for built in buttons.                                                                                       |                  TextStyle(color: Colors.white, fontWeight:FontWeight.w700, fontSize: 14)                 |
| showCloseIcon | bool                 | Control if close icon is appear.                                                     |                  false                  |
| closeIcon | Widget                 | Custom closeIcon.                                    |                  null                  |
| dialogBackgroundColor | Color                 |   custom background color for entire dialog.                               |                  Theme.of(context).cardColor                    |
| borderSide | BorderSide                 |   enable border en entire dialog shape                               |                  null                    |
| autoDismiss | bool                 |   When stetted to `false` clicking **Ok** or **Cancel** button won't dismiss the dialog. You can pass custom `Navigator.pop` function in the `onDissmissCallback`.                               |                  true                    |
| barrierColor | Color                 |   Color for the `barrier` around the dialog                               |                  Colors.black54                    |
| enableEnterKey | bool                 |   If `true`, hitting `Enter` key will act like pressing the **Ok** button.                               |                  false                    |



