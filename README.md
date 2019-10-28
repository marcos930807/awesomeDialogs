# awesome_dialog

A new Flutter package project for simple and awesome dialogs

## Usage

To use this package, add awesome_dialog as a dependency in your pubspec.yaml file.
And add this import to your file.

import 'package:awesome_dialog/awesome_dialog.dart';

## Image
![alt text](doc/gif.gif)

### Example

```
AwesomeDialog(context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            tittle: 'Dialog Title',
            desc: 'Dialog description here..................................................',
            btnCancelOnPress: () {},
            btnOkOnPress: () {}).show();
```
## Custom Body

If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.

```
AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            body: Center(child: Text(
                    'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),),
            tittle: 'This is Ignored',
            desc:   'This is also Ignored',
            btnOkOnPress: () {},
                 ).show();
```

## Custom Button

To use custom buttons, just specify the buttonOk or btnCancel widget, all text parameters icon etc will be ignored.

## Dissmiss and Callback

AwesomeDialog has onDissmissCallback() and can be dissmissed at any time using dissmiss() public method.





