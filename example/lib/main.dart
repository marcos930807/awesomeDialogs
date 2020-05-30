import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Dialog Example',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Awesome Dialog Example'),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              AnimatedButton(
                text: 'Info Dialog',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: false,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'INFO',
                    desc: 'Dialog description here...',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Info Dialog Without buttons',
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    headerAnimationLoop: false,
                    dialogType: DialogType.INFO,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'INFO',
                    desc: 'Dialog de.',
                  )..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Warning Dialog',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      headerAnimationLoop: false,
                      animType: AnimType.TOPSLIDE,
                      title: 'Warning',
                      desc:
                          'Dialog description here..................................................',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {})
                    ..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Error Dialog',
                color: Colors.red,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      headerAnimationLoop: false,
                      title: 'Error',
                      desc:
                          'Dialog description here..................................................',
                      btnOkOnPress: () {},
                      btnOkColor: Colors.red)
                    ..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Succes Dialog',
                color: Colors.green,
                pressEvent: () {
                  AwesomeDialog(
                      context: context,
                      animType: AnimType.LEFTSLIDE,
                      headerAnimationLoop: false,
                      dialogType: DialogType.SUCCES,
                      title: 'Succes',
                      desc:
                          'Dialog description here..................................................',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
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
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.INFO,
                    body: Center(
                      child: Text(
                        'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                  )..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Custom Buttons Dialog',
                color: Colors.brown,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    customHeader: Icon(
                      Icons.face,
                      size: 50,
                    ),

                    title: 'This is Custom',
                    desc: 'This is custom button and header',
                    btnOk: FlatButton(
                      child: Text('Custom Button'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    //this is ignored
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Auto Hide Dialog',
                color: Colors.purple,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.SCALE,
                    title: 'This is Custom',
                    desc: 'This is custom button and header',
                    autoHide: Duration(seconds: 2),
                  )..show();
                },
              ),
              SizedBox(
                height: 16,
              ),
              AnimatedButton(
                text: 'Testing Dialog',
                color: Colors.orange,
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    animType: AnimType.BOTTOMSLIDE,
                    btnCancelText: "Cancel Order",
                    btnOkText: "Yes, I will pay",
                    title: 'Continue to pay?',
                    padding: const EdgeInsets.all(16.0),
                    desc:
                        'Please confirm that you will pay 3000 INR within 30 mins. Creating orders without paying will create penalty charges, and your account may be disabled.',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
              ),
            ],
          ),
        )));
  }
}
