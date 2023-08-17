import 'dart:ui';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:interactive_map/utills/utils.dart';

class FullScreenButton extends StatefulWidget {
  FullScreenButton({Key? key}) : super(key: key);

  @override
  State<FullScreenButton> createState() => _FullScreenButtonState();
}

class _FullScreenButtonState extends State<FullScreenButton> {
  @override
  void initState() {
    // method();
    // window.onKeyData = (final keyData) {
    //   if (keyData.logical == LogicalKeyboardKey.escape.keyId) {
    //     print("change");
    //     if (isfullscreen) {
    //       isfullscreen = false;
    //     }
    //     return true;
    //   }
    //   print("change 2");

    //   /// Let event pass to other focuses if it is not the key we looking for
    //   return false;
    // };
  }

  bool isfullscreen = false;

  // Future<void> method() async {
  //   print(isfullscreen);
  //   isfullscreen = (await FullScreen.isFullScreen)!; //check current screen mode
  // }
  @override
  void dispose() {
    window.onKeyData = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // document.documentElement?.onFullscreenChange.listen((event) {
    //   print("change");
    //   if (document.fullscreenElement == null) {
    //     setState(() {
    //       isfullscreen = false;
    //     });
    //     print("object 1");
    //   } else {
    //     print("object 2");
    //   }
    // });
    // window.onKeyPress.listen((KeyboardEvent e) {
    //   print(e.charCode.toString() + " " + new String.fromCharCode(e.charCode));
    // });
    return
        // isfullscreen
        //     ? Container()
        //     :
        Align(
      alignment: Alignment.bottomLeft,
      child: GestureDetector(
        onTap: () async {
          // SystemChrome.setEnabledSystemUIOverlays([]);
          // document.documentElement?.requestFullscreen();
          Utils.enterFullScreenMode();
          // setState(() {
          //   isfullscreen = true;
          // });
          // print("c " + isfullscreen.toString());
          // bool isfullscreen = false;
          // print(isfullscreen);
          // isfullscreen = (await FullScreen
          //     .isFullScreen)!; //check current screen mode
          // print(isfullscreen);
          // if (isfullscreen) {
          //   await FullScreen.exitFullScreen();
          // } else {
          //   await FullScreen.enterFullScreen(
          //       FullScreenMode.EMERSIVE_STICKY);
          // }
          // await FullScreen.enterFullScreen(
          //     FullScreenMode.EMERSIVE_STICKY);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.fullscreen_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
