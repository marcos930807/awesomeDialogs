## [2.2.0] - 3/04/2022.
## Huge thanks to @OutdatedGuy
* New feature custom barrier color via prop "barrierColor" PR#96
* New feature use keyboard enter key to trigger ok button enable via prop "enableEnterKey" default to false PR#97
* New feature add props for custom titleStyle and descStyle via "titleTextStyle" and "descTextStyle"  PR#98
* New feature add padding between body and dialog when DialogType.NO_HEADER is selected via prop "bodyHeaderDistance" default to 15  PR#99
* Breaking the signature of some function change to fallow flutter_lints rules.  PR#100


## [2.1.3] - 27/03/2022.
* New feature to pass data back from dialog.
## [2.1.2] - 11/12/2021.
* Dependencies updated!!
## [2.1.1] - 17/8/2021.
* Fix useRootNavigator for nested routes.
## [2.1.0] - 27/5/2021.
* Migrated AnimatedButton to underline use ElevatedButton from flutter core.
* Improve padding in Error Animation.
* onDismiss Callback now indicates by which method the dialog was dismissed using an Enum. 
## [2.0.0] - 27/4/2021.
* Null safety stable release.
## [2.0.0-nullsafety.1] - 31/3/2021.
* Added DialogType INFO_REVERSED
## [2.0.0-nullsafety.0] - 13/3/2021.
* Migrated to Null Safety.
## [1.3.2] - 2/3/2021.
* Added Property buttonsTextStyle, to AwesomeDialog to easy customize built in buttons.
## [1.3.1] - 13/1/2021.
* Added Property buttonTextStyle, to AnimatedButton pr#56.
* Added Property borderSide, to customize the edges of the dialog pr#55.
* Added Property dialogBackgroundColor, to add custom background color pr#54.

## [1.3.0] - 30/12/2020.
* Added Property showCloseIcon, to control if close icon appear.
* Added Property closeIcon, to build a custom close icon.
* Added QUESTION dialogType support.
* Updated INFO dialogType to show info mark.
## [1.2.1] - 11/10/2020.
* Added Property buttonsBorderRadius.
* Safe Call operator on Navigation.of(context) before trying to dismiss the Dialog.
## [1.2.0] - 19/08/2020.
* Added Property width to control the maximum width of the dialog, especially useful in web flutter, or landscape mode, by default it is MediaQuery.of(context).size.width.
## [1.1.3] - 27/06/2020.
* Added Property dismissOnBackKeyPress to control if AwesomeDialog is dismissible by back button
## [1.1.2] - 9/06/2020.
* Added Property keyboardAware to control whenever or not add the Padding introducing on v1.1.1, and make it optional. Default value True.
## [1.1.1] - 9/06/2020.
* Added Padding EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) to AwesomeDialog to be aware of keyboard input
## [1.1.0] - 30/05/2020.
* [Breaking Change in title Prop]
* Merge Pull Request Fixed title prop and fixed some padding issues. #17, thanks to @iampawan.
## [1.0.1] - 28/05/2020.
* Exported anims helper class for external use.
## [1.0.0] - 28/05/2020.
* Added AutoHide feature.
* Added DialogType NO_HEADER feature.
* Organized project files.
## [0.1.4] - 30/04/2020.
* Upgrade dependencies. and animations.
## [0.1.3] - 19/02/2020.
* Fix tiny bug after features of version 0.1.2
## [0.1.2] - 19/02/2020.

* Upgrade dependencies
* Remove spacing for buttons if no buttons are especified.
* Added prop padding with default value EdgeInsets.only(left: 5, right: 5). this is not breaking change since this is the padding used on eraly version.

## [0.1.1] - 15/01/2020.

* Added prop headerAnimationLoop.
## [0.1.0] - 03/12/2019.

* Fix a bug when there is only a single button, removing unwanted space
## [0.0.5] - 25/11/2019.

* Added isDense property
* Added aligment property
## [0.0.4] - 18/11/2019.

* Change default color to Theme.of(context).cardColor
## [0.0.3] - 07/11/2019.

* Fix a Bug when using PressEvent() for Navigation.
## [0.0.2] - 28/10/2019.

* Formating text and enchancing description.
## [0.0.1] - 28/10/2019.

* Initial release.
