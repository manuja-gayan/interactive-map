import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/ipad_screen.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/motor.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/map_main_screen.dart';
import 'package:interactive_map/screens/vechicles/tractor.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';
import 'package:http/http.dart' as http;

class DairyBarnsVideo extends StatefulWidget {
  const DairyBarnsVideo({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _DairyBarnsVideoState createState() => _DairyBarnsVideoState();
}

class _DairyBarnsVideoState extends State<DairyBarnsVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _motorVideoController;
  bool _motorVideoPlaying = false;
  late VideoPlayerController _tractorVideoController;
  bool _tractorVideoPlaying = false;
  late VideoPlayerController _ipadVideoController;
  bool _ipadVideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  setIndex(value) {
    index = value;
    setState(() {});
  }

  setShow() {
    setState(() {
      show = !show;
    });
  }

  bool loading = true;

  @override
  void initState() {
    setState(() {
      loading = true;
    });

    index = 0;
    show = false;

    videoHandler();

    super.initState();
    setState(() {
      offsetHor = widget.offsetHor;
      offsetVer = widget.offsetVer;
    });
    loadText();
  }

  late final Map<String, dynamic> dairyBarnsTexts;

  Future<void> loadText() async {
    final response = await http.get(Uri.https(MOKIO_BASE_URL, DAIRYBARNS_TEXT));
    dairyBarnsTexts = json.decode(response.body);
  }

  videoHandler() async {
    _controller = VideoPlayerController.network(barn_REV);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.pause();
      _controller.setLooping(false);
    });
    if (widget.from == Pages.motorToHome) {
      await Future.delayed(Duration(milliseconds: 1000));
      _controller.play();

      _controller.addListener(() {
        final bool isPlaying = _controller.value.isPlaying;

        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
            setIndex(++index);
          });
          if (index > 1) {
            _controller.removeListener(() {});

            customPushReplacement(
                context,
                BuildingsHomeVideo(
                  offsetHor: offsetHor,
                  offsetVer: offsetVer,
                ));
          }
        }
      });
    } else {
      setShow();
    }

    _motorVideoController = VideoPlayerController.network(barn_to_TXMotor)
      ..initialize().then((_) => {
            setState(() {
              _motorVideoController.setVolume(0);
              _motorVideoController.setLooping(false);
            })
          });
    _tractorVideoController = VideoPlayerController.network(barn_To_Tractor)
      ..initialize().then((_) => {
            setState(() {
              _tractorVideoController.setVolume(0);
              _tractorVideoController.setLooping(false);
            })
          });
    _ipadVideoController = VideoPlayerController.network(barn_ipad)
      ..initialize().then((_) => {
            setState(() {
              _ipadVideoController.setVolume(0);
              _ipadVideoController.setLooping(false);
            })
          });
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _motorVideoController.dispose();
    _tractorVideoController.dispose();
    _ipadVideoController.dispose();

    super.dispose();
  }

  bool h = false;
  bool v = false;

  final ScrollController _scrollControllerHrizontal = ScrollController(
    initialScrollOffset: Get.find<Controller>().horizontalOffset.value,
  );

  final ScrollController _scrollControllerVertical = ScrollController(
    initialScrollOffset: Get.find<Controller>().verticalOffset.value,
  );
  static double offsetHor = 0;
  static double offsetVer = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (_scrollControllerHrizontal.hasClients) {
      _scrollControllerHrizontal.animateTo(
          _scrollControllerHrizontal.position.maxScrollExtent / 2,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
      offsetHor = _scrollControllerHrizontal.position.maxScrollExtent / 2;
      Get.find<Controller>().horizontalOffset.value = offsetHor;
    }

    if (_scrollControllerVertical.hasClients) {
      _scrollControllerVertical.animateTo(
          _scrollControllerVertical.position.maxScrollExtent / 2,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
      offsetVer = _scrollControllerVertical.position.maxScrollExtent / 2;
      Get.find<Controller>().verticalOffset.value = offsetVer;
    }

    if (screenSize.height < ScreenSizes.Mobile.height &&
        screenSize.width > ScreenSizes.Mobile.width) {
      if (screenSize.width - screenSize.width * 0.3 / screenSize.height ==
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = false;
      } else if (screenSize.width - screenSize.width * 0.3 / screenSize.height <
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = true;
      } else {
        v = true;
        h = false;
      }
      var screenSizeMobile1 =
          Size(screenSize.width - screenSize.width * 0.3, screenSize.height);
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonPanel(),
        body: Row(
          children: [
            Container(
              width: screenSize.width - screenSize.width * 0.3,
              height: screenSize.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerHrizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollControllerVertical,
                  child: SizedBox(
                    width: Utils.getVideoScreenWidth(screenSizeMobile1),
                    height: Utils.getVideoScreenHeight(screenSizeMobile1),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile1),
                          height: Utils.getVideoScreenHeight(screenSizeMobile1),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: Utils.getVideoScreenWidth(
                                    screenSizeMobile1),
                                height: Utils.getVideoScreenHeight(
                                    screenSizeMobile1),
                                child: VideoPlayer(_controller),
                              ),
                              _motorVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(_motorVideoController),
                                    )
                                  : Container(),
                              _tractorVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child:
                                          VideoPlayer(_tractorVideoController),
                                    )
                                  : Container(),
                              _ipadVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(_ipadVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: Image.network(
                                        barn_Plain,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: screenSize.height,
                width: screenSize.width - screenSize.width * 0.3,
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: screenSize.width - screenSize.width * 0.3,
                      child: Column(
                        children: [
                          !show
                              ? Container()
                              : motorMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          !show
                              ? Container()
                              : tractorMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          !show
                              ? Container()
                              : ipadScreenMobile(
                                  screenSize.width - screenSize.width * 0.3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (screenSize.width < ScreenSizes.Mobile.width) {
      if (screenSize.width / screenSize.height - screenSize.height * 0.3 ==
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = false;
      } else if (screenSize.width / screenSize.height -
              screenSize.height * 0.3 <
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = true;
      } else {
        v = true;
        h = false;
      }
      var screenSizeMobile2 =
          Size(screenSize.width, screenSize.height - screenSize.height * 0.3);
      return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonPanel(),
        body: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height - screenSize.height * 0.3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerHrizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollControllerVertical,
                  child: SizedBox(
                    width: Utils.getVideoScreenWidth(screenSizeMobile2),
                    height: Utils.getVideoScreenHeight(screenSizeMobile2),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile2),
                          height: Utils.getVideoScreenHeight(screenSizeMobile2),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: Utils.getVideoScreenWidth(
                                    screenSizeMobile2),
                                height: Utils.getVideoScreenHeight(
                                    screenSizeMobile2),
                                child: VideoPlayer(_controller),
                              ),
                              _motorVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(_motorVideoController),
                                    )
                                  : Container(),
                              _tractorVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child:
                                          VideoPlayer(_tractorVideoController),
                                    )
                                  : Container(),
                              _ipadVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(_ipadVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: Image.network(
                                        barn_Plain,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: screenSize.height * 0.3,
                width: screenSize.width,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: screenSize.width,
                      child: Column(
                        children: [
                          !show ? Container() : motorMobile(screenSize.width),
                          !show ? Container() : tractorMobile(screenSize.width),
                          !show
                              ? Container()
                              : ipadScreenMobile(screenSize.width),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      if (screenSize.width / screenSize.height ==
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = false;
      } else if (screenSize.width / screenSize.height <
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = true;
      } else {
        v = true;
        h = false;
      }
      return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonPanel(),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollControllerHrizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _scrollControllerVertical,
            child: SizedBox(
              width: Utils.getVideoScreenWidth(screenSize),
              height: Utils.getVideoScreenHeight(screenSize),
              child: Stack(
                children: [
                  SizedBox(
                    width: Utils.getVideoScreenWidth(screenSize),
                    height: Utils.getVideoScreenHeight(screenSize),
                    child: VideoPlayer(_controller),
                  ),
                  show ? motor() : Container(),
                  show ? tractor() : Container(),
                  show ? ipadScreen() : Container(),
                  _motorVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_motorVideoController),
                        )
                      : Container(),
                  _tractorVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_tractorVideoController),
                        )
                      : Container(),
                  _ipadVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_ipadVideoController),
                        )
                      : Container(),
                  loading
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: Image.network(
                            barn_Plain,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget floatingButtonPanel() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          FullScreenButton(),
          show
              ? Padding(
                  padding: EdgeInsets.only(
                      top: Utils.getTopPadding(screenSize, 100)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: TextAreaWithClip(
                      screenSize: screenSize,
                      texts: dairyBarnsTexts["TextAreaWithClipMain"]["texts"],
                      topic: dairyBarnsTexts["TextAreaWithClipMain"]["topic"],
                      description:
                          dairyBarnsTexts["TextAreaWithClipMain"]
                              ["description"],
                    ),
                  ),
                )
              : Container(),
          show ? menuButton() : Container(),
        ],
      ),
    );
  }

  Widget motorMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: dairyBarnsTexts["subTopics"][0],
      onPressed: () async {
        setShow();
        setState(() {
          _motorVideoPlaying = true;
        });
        _motorVideoController.play();

        _motorVideoController.addListener(() {
          final bool isPlaying = _motorVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _motorVideoController.removeListener(() {});
              customPushReplacement(
                  context,
                  Motor(
                    from: Pages.dairyBarns,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget ipadScreenMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: dairyBarnsTexts["subTopics"][1],
      onPressed: () async {
        setShow();
        setState(() {
          _ipadVideoPlaying = true;
        });
        _ipadVideoController.play();

        _ipadVideoController.addListener(() {
          final bool isPlaying = _ipadVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              customPushReplacement(
                  context,
                  IpadScreen(
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget tractorMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: dairyBarnsTexts["subTopics"][2],
      onPressed: () async {
        setShow();
        setState(() {
          _ipadVideoPlaying = true;
        });
        _tractorVideoController.play();

        _tractorVideoController.addListener(() {
          final bool isPlaying = _tractorVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              customPushReplacement(
                  context,
                  TractorVideo(
                    from: Pages.dairyBarns,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
      right: Utils.getRightPadding(screenSize, 0),
      child: Container(
        alignment: Alignment.topRight,
        height:
            screenSize.width *
            0.050 *
            Utils.getTopRightButtonMultiplier(screenSize.width),
        width: screenSize.width *
            0.050 *
            Utils.getTopRightButtonMultiplier(screenSize.width),
        child: GestureDetector(
          onTap: () {
            setShow();
            _controller.play();

            _controller.addListener(() {
              final bool isPlaying = _controller.value.isPlaying;

              if (isPlaying != _isPlaying) {
                setState(() {
                  _isPlaying = isPlaying;
                  setIndex(++index);
                });
                if (index > 1) {
                  _controller.removeListener(() {});
                  customPushReplacement(
                      context,
                      BuildingsHomeVideo(
                        offsetHor: offsetHor,
                        offsetVer: offsetVer,
                      ));
                }
              }
            });
          },
          child: Container(
            height: screenSize.width *
                0.050 *
                Utils.getTopRightButtonMultiplier(screenSize.width),
            width: screenSize.width *
                0.050 *
                Utils.getTopRightButtonMultiplier(screenSize.width),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget motor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.73,
        top: Utils.getVideoScreenHeight(screenSize) * 0.19,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _motorVideoPlaying = true;
                });
                _motorVideoController.play();

                _motorVideoController.addListener(() {
                  final bool isPlaying = _motorVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _motorVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          Motor(
                            from: Pages.dairyBarns,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: dairyBarnsTexts["subTopics"][0],
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget ipadScreen() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.65,
        top: Utils.getVideoScreenHeight(screenSize) * 0.75,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _ipadVideoPlaying = true;
                });
                _ipadVideoController.play();

                _ipadVideoController.addListener(() {
                  final bool isPlaying = _ipadVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      customPushReplacement(
                          context,
                          IpadScreen(
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: dairyBarnsTexts["subTopics"][1],
                type: 2,
              ),
            ),
          ],
        ));
  }

  Widget tractor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.81,
        top: Utils.getVideoScreenHeight(screenSize) * 0.385,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _tractorVideoPlaying = true;
                });
                _tractorVideoController.play();

                _tractorVideoController.addListener(() {
                  final bool isPlaying =
                      _tractorVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      customPushReplacement(
                          context,
                          TractorVideo(
                            from: Pages.dairyBarns,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: dairyBarnsTexts["subTopics"][2],
                type: 3,
              ),
            ),
          ],
        ));
  }
}
