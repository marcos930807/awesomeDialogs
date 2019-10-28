import 'package:fancy_dialog/animated_button.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Dialog Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fancy Dialog Example'),
        ),
        body: new HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          AnimatedButton(
            text: 'Info Dialog',
            pressEvent: () {
              FancyDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      tittle: 'INFO',
                      desc:
                          'Dialog description here..................................................',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {})
                  .show();
            },
          ),
          SizedBox(
            height: 16,
          ),
          AnimatedButton(
            text: 'Warning Dialog',
            color: Colors.orange,
            pressEvent: () {
              FancyDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.TOPSLIDE,
                      tittle: 'Warning',
                      desc:
                          'Dialog description here..................................................',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {})
                  .show();
            },
          ),
          SizedBox(
            height: 16,
          ),
          AnimatedButton(
            text: 'Error Dialog',
            color: Colors.red,
            pressEvent: () {
              FancyDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      tittle: 'Error',
                      desc:
                          'Dialog description here..................................................',
                      btnOkOnPress: () {},
                      btnOkColor: Colors.red)
                  .show();
            },
          ),
          SizedBox(
            height: 16,
          ),
          AnimatedButton(
            text: 'Succes Dialog',
            color: Colors.green,
            pressEvent: () {
              FancyDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  dialogType: DialogType.SUCCES,
                  tittle: 'Succes',
                  desc:
                      'Dialog description here..................................................',
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.check_circle,
                  onDissmissCallback: () {
                    debugPrint('Dialog Dissmiss from callback');
                  }).show();
            },
          ),
           SizedBox(
            height: 16,
          ),
          AnimatedButton(
            text: 'Custom Body Dialog',
            color: Colors.blueGrey,
            pressEvent: () {
              FancyDialog(
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
            },
          ),
           SizedBox(
            height: 16,
          ),
          AnimatedButton(
            text: 'Custom Buttons Dialog',
            color: Colors.brown,
            pressEvent: () {
              FancyDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  customHeader: Icon(Icons.face,size: 50,),
                 
                  tittle: 'This is Custom',
                  desc:
                      'This is custom button and header',
                  btnOk: FlatButton(child: Text('Custom Button'),onPressed: (){
                    Navigator.of(context).pop();
                  },),
                      //this is ignored
                  btnOkOnPress: () {},
                 ).show();
            },
          ),
        ],
      ),
    ));
  }
}
