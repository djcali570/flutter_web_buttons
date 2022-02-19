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
                  'Background Color',
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
                    animationDuration: const Duration(milliseconds: 500),
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
                FlutterWebButton.raiseText(
                  'Raise Text',
                  onPressed: () {},
                  flutterWebButtonOptions: FlutterWebButtonOptions(
                    buttonWidth: 200,
                    buttonRadius: 30,
                  ),
                ),
                FlutterWebButton.textScroll(
                  'Text Scroll',
                  onPressed: () {},
                  flutterWebButtonOptions: FlutterWebButtonOptions(
                    buttonWidth: 200,
                    textColor: const Color(0xFF2A2C2B),
                    buttonBackgroundColor: Colors.transparent,
                    buttonBorderColor: const Color(0XFF2E7D32), 
                    buttonRadius: 30,
                  ),
                ),
                FlutterWebButton.simple(
                  'Simple With Hero',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HeroPage()));
                  },
                  flutterWebButtonOptions: FlutterWebButtonOptions(
                    buttonWidth: 200,
                    heroTag: 'herotag',
                    isHeroWidget: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterWebButton.simpleIcon(
                  icon: Icons.menu,
                  onPressed: () {},
                  flutterWebIconButtonOptions:
                      FlutterWebIconOptions(color: Colors.black),
                ),
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
                FlutterWebButton.textColorChange(
                  'Text Color Change',
                  onPressed: () {},
                  textAnimatedColor: const Color(0XFF2E7D32),                  
                  flutterWebButtonOptions: FlutterWebButtonOptions(
                    buttonWidth: 200,
                    eliminateDecoration: true,                    
                    textColor: const Color(0xFF2A2C2B),
                    fontSize: 24,
                  ),
                ),
                FlutterWebButton.textUnderline(
                  'Underline Animation Default',
                  onPressed: () {},
                  animationDuration: const Duration(milliseconds: 500),
                  flutterTextOptions: FlutterTextOptions(fontSize: 24),
                ),
                FlutterWebButton.textUnderline(
                  'Underline Animation Center',
                  onPressed: () {},
                  flutterTextOptions: FlutterTextOptions(fontSize: 24),                  
                  animationCrossAxisAlignment: CrossAxisAlignment.center,
                ),
                FlutterWebButton.textMove(
                  'Move Text',
                  onPressed: () {},
                  moveDistanceX: 5,
                  flutterTextOptions: FlutterTextOptions(fontSize: 24),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterWebButton.buttonHighlightIconFill('Icon With Background Fill',
                    icon: Icons.add,
                    onPressed: () {},                                        
                    flutterTextOptions: FlutterTextOptions(
                      fontSize: 20,                      
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Page')),
      body: Center(
        child: Hero(
          tag: 'herotag',
          child: Container(
            width: double.infinity,
            height: 400,
            color: Colors.pink,
            child: const Center(
              child: Text(
                'This is a hero!',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
