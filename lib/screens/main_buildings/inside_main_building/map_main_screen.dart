import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/screens/main_buildings/bank.dart';
import 'package:interactive_map/screens/main_buildings/datacentre.dart';
import 'package:interactive_map/screens/main_buildings/fastfood.dart';
import 'package:interactive_map/screens/main_buildings/groceryshop.dart';
import 'package:interactive_map/screens/main_buildings/retail.dart';
import 'package:interactive_map/screens/main_buildings/school.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/screen_left.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/screen_right.dart';
import 'package:interactive_map/screens/main_buildings/warehouse.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';

class MapMainScreens extends StatefulWidget {
  const MapMainScreens({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _MapMainScreensState createState() => _MapMainScreensState();
}

class _MapMainScreensState extends State<MapMainScreens> {
  late VideoPlayerController _controller;

  late VideoPlayerController _leftScreenVideoController;
  bool _leftScreenVideoPlaying = false;
  late VideoPlayerController _rightScreenVideoController;
  bool _rightScreenVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;
  String url = '';

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
  }

  toNavigate(String from) {
    if (from == Pages.school) {
      return SchoolVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.bank) {
      return BankVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.grocery) {
      return GroceryShopVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.dataCenter) {
      return DataCentreVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.fastfoods) {
      return FastFoodVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.werehouse) {
      return WarehouseVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.retail) {
      return RetailVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.dairyBarns) {
      return RetailVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    }
  }

  videoHandler() async {
    if (widget.from == Pages.school) {
      url = school_REV;
    } else if (widget.from == Pages.bank) {
      url = bank_REV;
    } else if (widget.from == Pages.grocery) {
      url = groceryshop_REV;
    } else if (widget.from == Pages.dataCenter) {
      url = datacentre_REV;
    } else if (widget.from == Pages.fastfoods) {
      url = fastfood_REV;
    } else if (widget.from == Pages.werehouse) {
      url = warehouse_REV;
    } else if (widget.from == Pages.retail) {
      url = retail_REV;
    } else if (widget.from == Pages.dairyBarns) {
      url = barn_REV;
    }
    _controller = VideoPlayerController.network(url);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.pause();
      _controller.setLooping(false);
      show = true;
    });

    _leftScreenVideoController =
        VideoPlayerController.network(screen_LEFT_FW)
          ..initialize().then((_) => {
                setState(() {
                  _leftScreenVideoController.setVolume(0);
              _leftScreenVideoController.pause();
                  _leftScreenVideoController.setLooping(false);
                })
              });
    _rightScreenVideoController =
        VideoPlayerController.network(screen_RIGHT_FW)
          ..initialize().then((_) => {
                setState(() {
                  _rightScreenVideoController.setVolume(0);
              _rightScreenVideoController.pause();
                  _rightScreenVideoController.setLooping(false);
                })
              });

    setState(() {
      loading = false;
    });
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
                                child: Image.network(
                                  screen_MAIN,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              _leftScreenVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _leftScreenVideoController),
                                    )
                                  : Container(),
                              _rightScreenVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _rightScreenVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: Image.network(
                                        screen_MAIN,
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
                          show
                              ? screenLeftMobile(
                                  screenSize.width - screenSize.width * 0.3)
                              : Container(),
                          show
                              ? screenRightMobile(
                                  screenSize.width - screenSize.width * 0.3)
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
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  screen_MAIN,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              _leftScreenVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _leftScreenVideoController),
                                    )
                                  : Container(),
                              _rightScreenVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _rightScreenVideoController),
                                    )
                                  : Container(),
                              loading
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: Image.network(
                                        screen_MAIN,
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
                          show
                              ? screenLeftMobile(
                                  screenSize.width - screenSize.width * 0.3)
                              : Container(),
                          show
                              ? screenRightMobile(
                                  screenSize.width - screenSize.width * 0.3)
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
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: Image.network(
                            screen_MAIN,
                            fit: BoxFit.fill,
                          ),
                        ),
                        show ? screenLeft() : Container(),
                        show ? screenRight() : Container(),
                        _leftScreenVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_leftScreenVideoController),
                              )
                            : Container(),
                        _rightScreenVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_rightScreenVideoController),
                              )
                            : Container(),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  screen_MAIN,
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
          show ? menuButton() : Container(),
          show
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaWithClip(
                      screenSize: screenSize,
                      texts: [],
                      topic: "Turntide App for Mobile and Desktop",
                      description:
                          "Remotely monitor and manage HVAC equipment and your entire building",
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget screenLeft() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.35,
        top: Utils.getVideoScreenHeight(screenSize) * 0.34,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () async {
                setShow();
                setState(() {
                  _leftScreenVideoPlaying = true;
                });
                _leftScreenVideoController.play();

                _leftScreenVideoController.addListener(() {
                  final bool isPlaying =
                      _leftScreenVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _leftScreenVideoController.removeListener(() {});

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ScreenLeft(
                                  to: widget.from,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer),
                          transitionDuration: Duration(seconds: 2),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Smart Building Operations",
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget screenLeftMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      onPressed: () async {
        setShow();
        setState(() {
          _leftScreenVideoPlaying = true;
        });
        _leftScreenVideoController.play();

        _leftScreenVideoController.addListener(() {
          final bool isPlaying = _leftScreenVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _leftScreenVideoController.removeListener(() {});

              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => ScreenLeft(
                      to: widget.from,
                      offsetHor: offsetHor,
                      offsetVer: offsetVer),
                  transitionDuration: Duration(seconds: 2),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              );
            }
          }
        });
      },
      title: "Smart Building Operations",
      width: width,
    );
  }

  Widget screenRight() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.75,
        top: Utils.getVideoScreenHeight(screenSize) * 0.38,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setShow();
                if (_controller.value.isPlaying) {
                  _controller.pause();
                }

                setState(() {
                  _rightScreenVideoPlaying = true;
                });
                _rightScreenVideoController.play();

                _rightScreenVideoController.addListener(() {
                  final bool isPlaying =
                      _rightScreenVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _rightScreenVideoController.removeListener(() {});

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ScreenRight(
                            to: widget.from,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ),
                          transitionDuration: Duration(seconds: 2),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Smart HVAC",
                type: 2,
              ),
            ),
          ],
        ));
  }

  Widget screenRightMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      onPressed: () {
        setShow();
        if (_controller.value.isPlaying) {
          _controller.pause();
        }

        setState(() {
          _rightScreenVideoPlaying = true;
        });
        _rightScreenVideoController.play();

        _rightScreenVideoController.addListener(() {
          final bool isPlaying = _rightScreenVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _rightScreenVideoController.removeListener(() {});

              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => ScreenRight(
                    to: widget.from,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ),
                  transitionDuration: Duration(seconds: 2),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              );
            }
          }
        });
      },
      title: "Smart HVAC",
      width: width,
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
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    toNavigate(widget.from),
                transitionDuration: const Duration(seconds: 2),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
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
}
