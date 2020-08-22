import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waktusolatmalaysia/GetPrayerTime.dart';
import 'package:waktusolatmalaysia/ZoneChooser.dart';
import 'package:waktusolatmalaysia/utils/sizeconfig.dart';

void main() {
  runApp(RestartWidget(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malaysia Prayer Time 2020',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade900,
        brightness: Brightness.dark,
        title: Text(
          'MY Prayer Time BETA',
          style: GoogleFonts.balooTamma(),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Share prayer time',
            onPressed: () {
              print('button ditekan');
            },
          )
        ],
      ),
      body: AppBody(),
    );
  }
}

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight / 5.5,
            decoration: BoxDecoration(
              color: Colors.cyan.shade900,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Subuh',
                  style: GoogleFonts.robotoCondensed(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '5:71 am',
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    LocationChooser(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight / 45,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth / 10, 8.0,
                  SizeConfig.screenWidth / 10, 8.0),
              child: GetPrayerTime(),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight / 45,
          )
        ],
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});
  final Widget child;
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
