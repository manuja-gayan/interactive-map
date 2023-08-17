import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/screens/vechicles/inside_vehicle/transition.dart';
import 'package:interactive_map/screens/vechicles/vechicles_home.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';
import 'package:http/http.dart' as http;

class TrainVideo extends StatefulWidget {
  const TrainVideo({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _TrainVideoState createState() => _TrainVideoState();
}

class _TrainVideoState extends State<TrainVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _transition1VideoController;
  bool _transition1VideoPlaying = false;

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

  late final Map<String, dynamic> trainTexts;

  Future<void> loadText() async {
    final response = await http.get(Uri.https(MOKIO_BASE_URL, TRAIN_TEXT));
    trainTexts = json.decode(response.body);
  }

  videoHandler() async {
    _controller = VideoPlayerController.network(Veh_To_Train_REV);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.pause();
      _controller.setLooping(false);
    });
    if (widget.from == Pages.transitionPageToHome) {
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
                VechiclesHomeVideo(
                  offsetHor: offsetHor,
                  offsetVer: offsetVer,
                ));
          }
        }
      });
    } else {
      setShow();
    }

    _transition1VideoController =
        VideoPlayerController.network(Train_To_Battery)
      ..initialize().then((_) => {
            setState(() {
              _transition1VideoController.setVolume(0);
              _transition1VideoController.setLooping(false);
            })
          });
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _transition1VideoController.dispose();

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
                              _transition1VideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _transition1VideoController),
                                    )
                                  : Container(),

                              // loading
                              //     ? SizedBox(
                              //         width: Utils.getVideoScreenWidth(
                              //             screenSizeMobile1),
                              //         height: Utils.getVideoScreenHeight(
                              //             screenSizeMobile1),
                              //         child: Image.asset(
                              //           schoolImage,
                              //           fit: BoxFit.fill,
                              //         ),
                              //       )
                              //     : Container(),
                              
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
                              : transition1Mobile(
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
                              _transition1VideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _transition1VideoController),
                                    )
                                  : Container(),

                              // loading
                              //     ? SizedBox(
                              //         width: Utils.getVideoScreenWidth(
                              //             screenSizeMobile2),
                              //         height: Utils.getVideoScreenHeight(
                              //             screenSizeMobile2),
                              //         child: Image.asset(
                              //           schoolImage,
                              //           fit: BoxFit.fill,
                              //         ),
                              //       )
                              //     : Container(),
                              
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
                          !show
                              ? Container()
                              : transition1Mobile(screenSize.width),
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
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_controller),
                        ),
                        show ? transition1() : Container(),
                        _transition1VideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_transition1VideoController),
                              )
                            : Container(),

                        // loading
                        //     ? SizedBox(
                        //         width: Utils.getVideoScreenWidth(screenSize),
                        //         height: Utils.getVideoScreenHeight(screenSize),
                        //         child: Image.asset(
                        //           schoolImage,
                        //           fit: BoxFit.fill,
                        //         ),
                        //       )
                        //     : Container(),
                       
                      ],
                    ),
                  ),
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
                      texts: trainTexts["TextAreaWithClipMain"]
                          ["texts"],
                      topic: trainTexts["TextAreaWithClipMain"]
                          ["topic"],
                      description: trainTexts["TextAreaWithClipMain"]
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

  Widget transition1Mobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: trainTexts["subTopics"][0],
      onPressed: () async {
        setShow();
        setState(() {
          _transition1VideoPlaying = true;
        });
        _transition1VideoController.play();

        _transition1VideoController.addListener(() {
          final bool isPlaying = _transition1VideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _transition1VideoController.removeListener(() {});
              customPushReplacement(
                  context,
                  TransitionPage(
                    from: Pages.train,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                    url:
                        Train_Battery_Loop,
                    back:
                        Train_To_Battery,
                    topic: trainTexts["subTopicsInside"][0]
                        ["topic"],
                    subTopic: trainTexts["subTopicsInside"][0]
                        ["subTopic"],
                    descriptioTexts: trainTexts["subTopicsInside"][0]
                        ["descriptioTexts"],
                    blocks: trainTexts["subTopicsInside"][0]
                        ["blocks"],
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
                      VechiclesHomeVideo(
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

  Widget transition1() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.608,
        top: Utils.getVideoScreenHeight(screenSize) * 0.67,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _transition1VideoPlaying = true;
                });
                _transition1VideoController.play();

                _transition1VideoController.addListener(() {
                  final bool isPlaying =
                      _transition1VideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _transition1VideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          TransitionPage(
                            from: Pages.train,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                            url:
                                Train_Battery_Loop,
                            back:
                                Train_To_Battery,
                            topic: trainTexts["subTopicsInside"]
                                [0]["topic"],
                            subTopic: trainTexts["subTopicsInside"][0]
                                ["subTopic"],
                            descriptioTexts:
                                trainTexts["subTopicsInside"][0]
                                    ["descriptioTexts"],
                            blocks: trainTexts["subTopicsInside"]
                                [0]["blocks"],
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: trainTexts["subTopics"][0],
                type: 1,
              ),
            ),
          ],
        ));
  }
}
