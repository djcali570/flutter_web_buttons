import 'package:flutter/material.dart';
import 'package:flutter_web_buttons/flutter_web_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Web Buttons Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterWebButton.backgroundColorChange(
              'My Button',
              onPressed: () {
                debugPrint('Button Pressed');
              },
              flutterWebButtonOptions: FlutterWebButtonOptions(
                  buttonWidth: 200,
                  buttonRadius: 8,
                  boxShadowColor: Colors.black.withOpacity(.8)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterWebButton.socialIcon(
                  flutterWebButtonSocialIcon:
                      FlutterWebButtonSocialIcon.instagram,
                  onPressed: () {},
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.pink),
                ),
                FlutterWebButton.socialIcon(
                  flutterWebButtonSocialIcon:
                      FlutterWebButtonSocialIcon.facebook,
                  onPressed: () {},
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.blue),
                ),
                FlutterWebButton.socialIcon(
                  flutterWebButtonSocialIcon:
                      FlutterWebButtonSocialIcon.youtube,
                  onPressed: () {},
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.red),
                ),
                FlutterWebButton.socialIcon(
                  flutterWebButtonSocialIcon:
                      FlutterWebButtonSocialIcon.twitter,
                  onPressed: () {},
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
