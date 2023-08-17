import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/motor.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/map_main_screen.dart';
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

class FastFoodVideo extends StatefulWidget {
  const FastFoodVideo({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _FastFoodVideoState createState() => _FastFoodVideoState();
}

class _FastFoodVideoState extends State<FastFoodVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _motorVideoController;
  bool _motorVideoPlaying = false;
  late VideoPlayerController _energySavingVideoController;
  bool _energySavingVideoPlaying = false;
  late VideoPlayerController _mapVideoController;
  bool _mapVideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  bool showEnergySaving = false;

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

  late final Map<String, dynamic> fastFoodTexts;

  Future<void> loadText() async {
    final response = await http.get(Uri.https(MOKIO_BASE_URL, FASTFOOD_TEXT));
    fastFoodTexts = json.decode(response.body);
  }

  videoHandler() async {
    _controller = VideoPlayerController.network(fastfood_REV);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.pause();
      _controller.setLooping(false);
    });
    if (widget.from == Pages.map || widget.from == Pages.motorToHome) {
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

    _motorVideoController = VideoPlayerController.network(fastfood_MOTOR)
      ..initialize().then((_) => {
            setState(() {
              _motorVideoController.setVolume(0);
              _motorVideoController.setLooping(false);
            })
          });
    _energySavingVideoController =
        VideoPlayerController.network(fastfood_MOTOR)
          ..initialize().then((_) => {
                setState(() {
                  _energySavingVideoController.setVolume(0);
                  _energySavingVideoController.setLooping(false);
                })
              });
    _mapVideoController = VideoPlayerController.network(fastfood_MAP)
      ..initialize().then((_) => {
            setState(() {
              _mapVideoController.setVolume(0);
              _mapVideoController.setLooping(false);
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
    _energySavingVideoController.dispose();
    _mapVideoController.dispose();

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
                              _energySavingVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _energySavingVideoController),
                                    )
                                  : Container(),
                              _mapVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(_mapVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: Image.network(
                                        fastfood_Plain,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                              show
                                  ? Positioned(
                                      left: Utils.getVideoScreenWidth(
                                              screenSizeMobile1) *
                                          0.5,
                                      child: Container(
                                        width: Utils.getVideoScreenWidth(
                                                screenSizeMobile1) *
                                            0.075,
                                        height: Utils.getVideoScreenHeight(
                                                screenSizeMobile1) *
                                            0.3,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(dataAnimationGif),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
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
                              : energySavingMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          !show
                              ? Container()
                              : mapScreenMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          showEnergySaving
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setShow();
                                      setState(() {
                                        showEnergySaving = false;
                                      });
                                    },
                                    child: Container(
                                      width: screenSize.width *
                                          0.091 *
                                          Utils.getMultiplier(screenSize.width),
                                      height: screenSize.width *
                                          0.040 *
                                          Utils.getMultiplier(screenSize.width),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(nextImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
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
                              _energySavingVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _energySavingVideoController),
                                    )
                                  : Container(),
                              _mapVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(_mapVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: Image.network(
                                        fastfood_Plain,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                              show
                                  ? Positioned(
                                      left: Utils.getVideoScreenWidth(
                                              screenSizeMobile2) *
                                          0.5,
                                      child: Container(
                                        width: Utils.getVideoScreenWidth(
                                                screenSizeMobile2) *
                                            0.075,
                                        height: Utils.getVideoScreenHeight(
                                                screenSizeMobile2) *
                                            0.3,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(dataAnimationGif),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
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
                          !show
                              ? Container()
                              : energySavingMobile(screenSize.width),
                          !show
                              ? Container()
                              : mapScreenMobile(screenSize.width),
                          showEnergySaving
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      setShow();
                                      setState(() {
                                        showEnergySaving = false;
                                      });
                                    },
                                    child: Container(
                                      width: screenSize.width *
                                          0.091 *
                                          Utils.getMultiplier(screenSize.width),
                                      height: screenSize.width *
                                          0.040 *
                                          Utils.getMultiplier(screenSize.width),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(nextImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
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
                  show ? energySaving() : Container(),
                  show ? mapScreen() : Container(),
                  _motorVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_motorVideoController),
                        )
                      : Container(),
                  _energySavingVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_energySavingVideoController),
                        )
                      : Container(),
                  _mapVideoPlaying
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_mapVideoController),
                        )
                      : Container(),
                  loading
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: Image.network(
                            fastfood_Plain,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(),
                  show
                      ? Positioned(
                          left: Utils.getVideoScreenWidth(screenSize) * 0.65,
                          child: Container(
                            width: Utils.getVideoScreenWidth(screenSize) * 0.12,
                            height:
                                Utils.getVideoScreenHeight(screenSize) * 0.45,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(dataAnimationGif),
                                fit: BoxFit.cover,
                              ),
                            ),
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
                      texts: fastFoodTexts["TextAreaWithClipMain"]["texts"],
                      topic: fastFoodTexts["TextAreaWithClipMain"]["topic"],
                      description: fastFoodTexts["TextAreaWithClipMain"]
                          ["description"],
                    ),
                  ),
                )
              : Container(),
          showEnergySaving
              ? Padding(
                  padding: EdgeInsets.only(
                      top: Utils.getTopPadding(screenSize, 100)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: TextAreaWithClip(
                      screenSize: screenSize,
                      texts: fastFoodTexts["TextAreaWithClipEnergySaving"]
                          ["texts"],
                      topic: fastFoodTexts["TextAreaWithClipEnergySaving"]
                          ["topic"],
                      description: fastFoodTexts["TextAreaWithClipEnergySaving"]
                          ["description"],
                    ),
                  ),
                )
              : Container(),
          showEnergySaving &&
                  screenSize.width > ScreenSizes.Mobile.width &&
                  screenSize.height > ScreenSizes.Mobile.height
              ? Positioned(
                  right: 0,
                  bottom: Utils.getBottomPadding(screenSize, 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        setShow();
                        setState(() {
                          showEnergySaving = false;
                        });
                      },
                      child: Container(
                        width: screenSize.width *
                            0.091 *
                            Utils.getMultiplier(screenSize.width),
                        height: screenSize.width *
                            0.040 *
                            Utils.getMultiplier(screenSize.width),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(nextImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
      title: fastFoodTexts["subTopics"][0],
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
                    from: Pages.fastfoods,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget energySavingMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: fastFoodTexts["subTopics"][1],
      onPressed: () async {
        setShow();
        setState(() {
          showEnergySaving = true;
        });
      },
    );
  }

  Widget mapScreenMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: fastFoodTexts["subTopics"][2],
      onPressed: () async {
        setShow();
        setState(() {
          _mapVideoPlaying = true;
        });
        _mapVideoController.play();

        _mapVideoController.addListener(() {
          final bool isPlaying = _mapVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              customPushReplacement(
                  context,
                  MapMainScreens(
                    from: Pages.school,
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
        left: Utils.getVideoScreenWidth(screenSize) * 0.725,
        top: Utils.getVideoScreenHeight(screenSize) * 0.42,
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
                            from: Pages.fastfoods,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: fastFoodTexts["subTopics"][0],
                type: 2,
              ),
            ),
          ],
        ));
  }

  Widget energySaving() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.531,
        top: Utils.getVideoScreenHeight(screenSize) * 0.647,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  showEnergySaving = true;
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: fastFoodTexts["subTopics"][1],
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget mapScreen() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.71,
        top: Utils.getVideoScreenHeight(screenSize) * 0.23,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _mapVideoPlaying = true;
                });
                _mapVideoController.play();

                _mapVideoController.addListener(() {
                  final bool isPlaying = _mapVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      customPushReplacement(
                          context,
                          MapMainScreens(
                            from: Pages.fastfoods,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: fastFoodTexts["subTopics"][2],
                type: 3,
              ),
            ),
          ],
        ));
  }
}
