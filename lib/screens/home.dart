import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/vechicles/vechicles_home.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:video_player/video_player.dart';
import 'dart:html';

class Home extends StatefulWidget {
  const Home({Key? key, this.offsetHor, this.offsetVer}) : super(key: key);
  final offsetHor;
  final offsetVer;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;

  late VideoPlayerController _timerVideoController;

  late VideoPlayerController _buildingsVideoController;
  bool _buildingsVideoPlaying = false;
  late VideoPlayerController _vechiclesVideoController;
  bool _vechiclesVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;

  bool timerOFF = false;

  setIndex(value) {
    index = value;
    setState(() {});
  }

  setShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    setState(() {
      loading = true;
    });

    index = 0;
    show = true;

    videoHandler();

    super.initState();
  }

  
  videoHandler() async {
    _timerVideoController = VideoPlayerController.network(Intro_Loop);
    await _timerVideoController.initialize();
    setState(() {
      _timerVideoController.setVolume(0);
      _timerVideoController.pause();
      _timerVideoController.setLooping(true);
      setShow();
    });

    _buildingsVideoController =
        VideoPlayerController.network(Intro_to_Buildings)
          ..initialize().then((_) => {
                setState(() {
                  _buildingsVideoController.setVolume(0);
                  _buildingsVideoController.setLooping(false);
                })
              });
    _vechiclesVideoController = VideoPlayerController.network(Intro_to_Vehicles)
      ..initialize().then((_) => {
            setState(() {
              _vechiclesVideoController.setVolume(0);
              _vechiclesVideoController.setLooping(false);
            })
          });

    //await Future.delayed(const Duration(seconds: 2));
    _timerVideoController.play();
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _timerVideoController.dispose();
    _buildingsVideoController.dispose();
    _vechiclesVideoController.dispose();

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
                          child: VideoPlayer(_timerVideoController),
                        ),
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile1),
                          height: Utils.getVideoScreenHeight(screenSizeMobile1),
                          child: Stack(
                            children: [
                              _buildingsVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _buildingsVideoController),
                                    )
                                  : Container(),
                              _vechiclesVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _vechiclesVideoController),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  Intro_still,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(),
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
                          show
                              ? Container()
                              : buildingsMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : vechiclesMobile(
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
                          child: VideoPlayer(_timerVideoController),
                        ),
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile2),
                          height: Utils.getVideoScreenHeight(screenSizeMobile2),
                          child: Stack(
                            children: [
                              _buildingsVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _buildingsVideoController),
                                    )
                                  : Container(),
                              _vechiclesVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _vechiclesVideoController),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  Intro_still,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(),
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
                          show
                              ? Container()
                              : buildingsMobile(screenSize.width),
                          show
                              ? Container()
                              : vechiclesMobile(screenSize.width),
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
                    child: VideoPlayer(_timerVideoController),
                  ),
                  show ? Container() : buildings(),
                  show ? Container() : vechicles(),
                  SizedBox(
                    width: Utils.getVideoScreenWidth(screenSize),
                    height: Utils.getVideoScreenHeight(screenSize),
                    child: Stack(
                      children: [
                        _buildingsVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_buildingsVideoController),
                              )
                            : Container(),
                        _vechiclesVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_vechiclesVideoController),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  loading
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: Image.network(
                            Intro_still,
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
    return Stack(
      alignment: Alignment.bottomLeft,
      //fit: StackFit.expand,
      children: [
        FullScreenButton(),
      ],
    );
  }

  Widget buildings() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.29,
        top: Utils.getVideoScreenHeight(screenSize) * 0.42,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  setShow();
                  setState(() {
                    timerOFF = true;
                  });

                  _timerVideoController.pause();

                  setState(() {
                    _buildingsVideoPlaying = true;
                  });

                  _buildingsVideoController.play();

                  await Future.delayed(const Duration(milliseconds: 200));

                  _buildingsVideoController.addListener(() {
                    final bool isPlaying =
                        _buildingsVideoController.value.isPlaying;
                    print(isPlaying);
                    if (isPlaying != _isPlaying) {
                      setState(() {
                        _isPlaying = isPlaying;
                        setIndex(++index);
                      });
                      if (index > 1) {
                        _buildingsVideoController.removeListener(() {});
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
                child: CustomButtonLabelWithClip(
                  screenSize: screenSize,
                  text: "Sustainable Buildings",
                  type: 0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildingsMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Sustainable Buildings",
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _buildingsVideoPlaying = true;
        });

        _buildingsVideoController.play();

        await Future.delayed(const Duration(milliseconds: 200));

        _buildingsVideoController.addListener(() {
          final bool isPlaying = _buildingsVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _buildingsVideoController.removeListener(() {});
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
    );
  }

  Widget vechicles() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.63,
        top: Utils.getVideoScreenHeight(screenSize) * 0.48,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _vechiclesVideoPlaying = true;
                });

                _vechiclesVideoController.play();

                await Future.delayed(const Duration(milliseconds: 200));

                _vechiclesVideoController.addListener(() {
                  final bool isPlaying =
                      _vechiclesVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _vechiclesVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          VechiclesHomeVideo(
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Electrified Transport",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget vechiclesMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Electrified Transport",
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _vechiclesVideoPlaying = true;
        });

        _vechiclesVideoController.play();

        await Future.delayed(const Duration(milliseconds: 200));

        _vechiclesVideoController.addListener(() {
          final bool isPlaying = _vechiclesVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _vechiclesVideoController.removeListener(() {});
              customPushReplacement(
                  context,
                  VechiclesHomeVideo(
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }
}
