import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/controller/appBind.dart';
import 'package:interactive_map/screens/home.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/vechicles/excavator.dart';
import 'package:interactive_map/screens/vechicles/sportsCar.dart';
import 'package:interactive_map/screens/vechicles/train.dart';
import 'package:interactive_map/screens/vechicles/vechicles_home.dart';
import 'package:web_browser_detect/web_browser_detect.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InteractiveMap());
}

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({Key? key}) : super(key: key);

  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      print(kIsWeb);
      // running on the web!
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turntide App',
      initialBinding: AppBinding(),
      scrollBehavior: MyCustomScrollBehavior(),
      // home: Theme.of(context).platform == TargetPlatform.iOS ||
      //         Browser().browser == 'Safari'
      //     ? EmptyScreen()
      //     : Home(),
      home: Home(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'This app is currently unavailable on iOS/Safari, for optimal experience please use chrome on a computer or android mobile device.',
          style: GoogleFonts.barlow(
            textStyle: TextStyle(
              color: AppColors.night,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
