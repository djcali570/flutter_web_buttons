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
  GlobalKey txtKey = GlobalKey();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                FlutterWebButton.backgroundFill('Background Fill',
                    onPressed: () {},
                    flutterWebButtonOptions:
                        FlutterWebButtonOptions(buttonWidth: 200)),
                FlutterWebButton.grow(
                  'Button Grow',
                  onPressed: () {
                    debugPrint(txtKey.currentContext!.size!.width.toString());
                  },
                  flutterWebButtonOptions: FlutterWebButtonOptions(
                    buttonWidth: 200,
                  ),
                ),
              ],
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
                FlutterWebButton.socialIconGrow(
                  flutterWebButtonSocialIcon: FlutterWebButtonSocialIcon.github,
                  onPressed: () {},
                  flutterWebIconButtonOptions: FlutterWebIconOptions(),
                ),
                FlutterWebButton.iconGrow(
                  icon: Icons.favorite,
                  onPressed: () {},
                  growAmount: 2,
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.red),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterWebButton.textUnderline(
                  'Underline Animation Default',
                  onPressed: () {},
                  flutterTextOptions: FlutterTextOptions(fontSize: 24),
                ),
                FlutterWebButton.textUnderline(
                  'Underline Animation Center',
                  onPressed: () {},
                  flutterTextOptions: FlutterTextOptions(fontSize: 24),
                  textAnimatedColor: Colors.blue,
                  animationCrossAxisAlignment: CrossAxisAlignment.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  double getTextWidth() {
    if (txtKey.currentContext != null) {
      final txtBox = txtKey.currentContext!.findRenderObject() as RenderBox;
      return txtBox.size.width;
    }
    return 0;
  }
}
