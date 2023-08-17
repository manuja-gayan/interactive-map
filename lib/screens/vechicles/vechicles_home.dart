import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/vechicles/avgNarm.dart';
import 'package:interactive_map/screens/vechicles/bus.dart';
import 'package:interactive_map/screens/vechicles/excavator.dart';
import 'package:interactive_map/screens/vechicles/sportsCar.dart';
import 'package:interactive_map/screens/vechicles/tractor.dart';
import 'package:interactive_map/screens/vechicles/train.dart';
import 'package:interactive_map/screens/vechicles/truck.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_small_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_QR_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';
import 'package:http/http.dart' as http;

class VechiclesHomeVideo extends StatefulWidget {
  const VechiclesHomeVideo({Key? key, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  @override
  _VechiclesHomeVideoState createState() => _VechiclesHomeVideoState();
}

class _VechiclesHomeVideoState extends State<VechiclesHomeVideo> {
  bool loading = false;

  late VideoPlayerController _timerVideoController;

  late VideoPlayerController _trainVideoController;
  bool _trainVideoPlaying = false;
  late VideoPlayerController _sportsCarVideoController;
  bool _sportsCarVideoPlaying = false;
  late VideoPlayerController _avgNarmVideoController;
  bool _avgNarmVideoPlaying = false;
  late VideoPlayerController _busVideoController;
  bool _busVideoPlaying = false;
  late VideoPlayerController _tractorVideoController;
  bool _tractorVideoPlaying = false;
  late VideoPlayerController _excavatorVideoController;
  bool _excavatorVideoPlaying = false;
  late VideoPlayerController _truckVideoController;
  bool _truckVideoPlaying = false;

  late VideoPlayerController _buildingTransitionVideoController;
  bool _buildingTransitionVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;

  bool timerOFF = false;

  bool showQR = false;
  bool showTextAreaSmall = false;
  bool showNext = false;
  late String nextPage;

  double width = 0;

  double _currentOpacity = 0;
  bool fading = false;
  // late String fadingImage;

  method() async {
    await Future.delayed(Duration(milliseconds: 1));
    setState(() {
      _currentOpacity = 1;
    });
  }

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
    loadText();
  }

  late final Map<String, dynamic> avgNarmTexts;
  late final Map<String, dynamic> trainTexts;
  late final Map<String, dynamic> sportsCarTexts;
  late final Map<String, dynamic> tractorTexts;
  late final Map<String, dynamic> busTexts;
  late final Map<String, dynamic> excavatorTexts;
  late final Map<String, dynamic> truckTexts;

  Future<void> loadText() async {
    avgNarmTexts = await loadTextFromBucket(AVGNRM_TEXT);
    trainTexts = await loadTextFromBucket(TRAIN_TEXT);
    sportsCarTexts = await loadTextFromBucket(SPORTSCAR_TEXT);
    tractorTexts = await loadTextFromBucket(TRACTOR_TEXT);
    busTexts = await loadTextFromBucket(BUS_TEXT);
    excavatorTexts = await loadTextFromBucket(EXCAVATOR_TEXT);
    truckTexts = await loadTextFromBucket(TRUCK_TEXT);
  }

  Future<dynamic> loadTextFromBucket(path) async {
    final response = await http.get(Uri.https(MOKIO_BASE_URL, path));
    return json.decode(response.body);
  }
  
  videoHandler() async {
    _timerVideoController = VideoPlayerController.network(Vehicles_Main_Loop);
    await _timerVideoController.initialize();
    setState(() {
      _timerVideoController.setVolume(0);
      _timerVideoController.pause();
      _timerVideoController.setLooping(true);
      setShow();
    });

    _buildingTransitionVideoController =
        VideoPlayerController.network(Vehicles_To_Buildings)
          ..initialize().then((_) => {
                setState(() {
                  _buildingTransitionVideoController.setVolume(0);
                  _buildingTransitionVideoController.setLooping(false);
                })
              });
    _trainVideoController = VideoPlayerController.network(Veh_To_Train)
      ..initialize().then((_) => {
            setState(() {
              _trainVideoController.setVolume(0);
              _trainVideoController.setLooping(false);
            })
          });
    _sportsCarVideoController = VideoPlayerController.network(Veh_To_Car)
      ..initialize().then((_) => {
            setState(() {
              _sportsCarVideoController.setVolume(0);
              _sportsCarVideoController.setLooping(false);
            })
          });
    _avgNarmVideoController = VideoPlayerController.network(Veh_To_AGV)
      ..initialize().then((_) => {
            setState(() {
              _avgNarmVideoController.setVolume(0);
              _avgNarmVideoController.setLooping(false);
            })
          });
    _busVideoController = VideoPlayerController.network(Veh_To_Bus)
      ..initialize().then((_) => {
            setState(() {
              _busVideoController.setVolume(0);
              _busVideoController.setLooping(false);
            })
          });
    _tractorVideoController = VideoPlayerController.network(Veh_To_Tractor)
      ..initialize().then((_) => {
            setState(() {
              _tractorVideoController.setVolume(0);
              _tractorVideoController.setLooping(false);
            })
          });
    _excavatorVideoController = VideoPlayerController.network(Veh_To_Exc)
      ..initialize().then((_) => {
            setState(() {
              _excavatorVideoController.setVolume(0);
              _excavatorVideoController.setLooping(false);
            })
          });
    _truckVideoController = VideoPlayerController.network(Veh_To_Truck)
      ..initialize().then((_) => {
            setState(() {
              _truckVideoController.setVolume(0);
              _truckVideoController.setLooping(false);
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
    _trainVideoController.dispose();
    _sportsCarVideoController.dispose();
    _avgNarmVideoController.dispose();
    _busVideoController.dispose();
    _tractorVideoController.dispose();
    _excavatorVideoController.dispose();
    _truckVideoController.dispose();

    _buildingTransitionVideoController.dispose();

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
                              _buildingTransitionVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _buildingTransitionVideoController),
                                    )
                                  : Container(),
                              _trainVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child:
                                            VideoPlayer(_trainVideoController),
                                      ),
                                    )
                                  : Container(),
                              _sportsCarVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child: VideoPlayer(
                                            _sportsCarVideoController),
                                      ),
                                    )
                                  : Container(),
                              _avgNarmVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child: VideoPlayer(
                                            _avgNarmVideoController),
                                      ),
                                    )
                                  : Container(),
                              _busVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child: VideoPlayer(_busVideoController),
                                      ),
                                    )
                                  : Container(),
                              _tractorVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child: VideoPlayer(
                                            _tractorVideoController),
                                      ),
                                    )
                                  : Container(),
                              _excavatorVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child: VideoPlayer(
                                            _excavatorVideoController),
                                      ),
                                    )
                                  : Container(),
                              _truckVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile1),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile1),
                                        child:
                                            VideoPlayer(_truckVideoController),
                                      ),
                                    )
                                  : Container(),
                              // fading
                              //     ? AnimatedOpacity(
                              //         opacity: _currentOpacity,
                              //         duration: Duration(seconds: 1),
                              //         child: Container(
                              //           width: Utils.getVideoScreenWidth(
                              //               screenSizeMobile1),
                              //           height: Utils.getVideoScreenHeight(
                              //               screenSizeMobile1),
                              //           child: Image.asset(
                              //             fadingImage,
                              //             fit: BoxFit.fill,
                              //           ),
                              //         ),
                              //       )
                              //     : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  Vehicles_Still,
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
                          // showNext
                          //     ? Padding(
                          //         padding:
                          //             const EdgeInsets.symmetric(vertical: 10),
                          //         child: GestureDetector(
                          //           onTap: () {
                          //             switch (nextPage) {
                          //               case Pages.avgNarm:
                          //                 customPushReplacement(
                          //                     context,
                          //                     AvgNArmVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.train:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TrainVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.excavator:
                          //                 customPushReplacement(
                          //                     context,
                          //                     ExcavatorVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.sportsCar:
                          //                 customPushReplacement(
                          //                     context,
                          //                     SportsCarVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.truck:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TruckVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.tractor:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TractorVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.bus:
                          //                 customPushReplacement(
                          //                     context,
                          //                     BusVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               default:
                          //             }
                          //             setState(() {
                          //               showNext = false;
                          //             });
                          //           },
                          //           child: Container(
                          //             width: screenSize.width *
                          //                 0.091 *
                          //                 Utils.getMultiplier(screenSize.width),
                          //             height: screenSize.width *
                          //                 0.040 *
                          //                 Utils.getMultiplier(screenSize.width),
                          //             decoration: const BoxDecoration(
                          //               image: DecorationImage(
                          //                 image: AssetImage(nextImage),
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                          show
                              ? Container()
                              : avgNarmMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : trainMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : sportsCarMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : busMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : tractorMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : excavatorMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : truckMobile(
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
                              _buildingTransitionVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _buildingTransitionVideoController),
                                    )
                                  : Container(),
                              _trainVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child:
                                            VideoPlayer(_trainVideoController),
                                      ),
                                    )
                                  : Container(),
                              _sportsCarVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child: VideoPlayer(
                                            _sportsCarVideoController),
                                      ),
                                    )
                                  : Container(),
                              _avgNarmVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child: VideoPlayer(
                                            _avgNarmVideoController),
                                      ),
                                    )
                                  : Container(),
                              _busVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child: VideoPlayer(_busVideoController),
                                      ),
                                    )
                                  : Container(),
                              _tractorVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child: VideoPlayer(
                                            _tractorVideoController),
                                      ),
                                    )
                                  : Container(),
                              _excavatorVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child: VideoPlayer(
                                            _excavatorVideoController),
                                      ),
                                    )
                                  : Container(),
                              _truckVideoPlaying
                                  ? AnimatedOpacity(
                                      opacity: _currentOpacity,
                                      duration: Duration(seconds: 1),
                                      child: SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSizeMobile2),
                                        height: Utils.getVideoScreenHeight(
                                            screenSizeMobile2),
                                        child:
                                            VideoPlayer(_truckVideoController),
                                      ),
                                    )
                                  : Container(),
                              // fading
                              //     ? AnimatedOpacity(
                              //         opacity: _currentOpacity,
                              //         duration: Duration(seconds: 1),
                              //         child: Container(
                              //           width: Utils.getVideoScreenWidth(
                              //               screenSizeMobile2),
                              //           height: Utils.getVideoScreenHeight(
                              //               screenSizeMobile2),
                              //           child: Image.asset(
                              //             fadingImage,
                              //             fit: BoxFit.fill,
                              //           ),
                              //         ),
                              //       )
                              //     : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: Image.network(
                                  Vehicles_Still,
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
                          // showNext
                          //     ? Padding(
                          //         padding:
                          //             const EdgeInsets.symmetric(vertical: 10),
                          //         child: GestureDetector(
                          //           onTap: () {
                          //             switch (nextPage) {
                          //               case Pages.avgNarm:
                          //                 customPushReplacement(
                          //                     context,
                          //                     AvgNArmVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.train:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TrainVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.excavator:
                          //                 customPushReplacement(
                          //                     context,
                          //                     ExcavatorVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.sportsCar:
                          //                 customPushReplacement(
                          //                     context,
                          //                     SportsCarVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.truck:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TruckVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.tractor:
                          //                 customPushReplacement(
                          //                     context,
                          //                     TractorVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               case Pages.bus:
                          //                 customPushReplacement(
                          //                     context,
                          //                     BusVideo(
                          //                       from: Pages.vehicle,
                          //                       offsetHor: offsetHor,
                          //                       offsetVer: offsetVer,
                          //                     ));
                          //                 break;
                          //               default:
                          //             }
                          //             setState(() {
                          //               showNext = false;
                          //             });
                          //           },
                          //           child: Container(
                          //             width: screenSize.width *
                          //                 0.091 *
                          //                 Utils.getMultiplier(screenSize.width),
                          //             height: screenSize.width *
                          //                 0.040 *
                          //                 Utils.getMultiplier(screenSize.width),
                          //             decoration: const BoxDecoration(
                          //               image: DecorationImage(
                          //                 image: AssetImage(nextImage),
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                          show ? Container() : avgNarmMobile(screenSize.width),
                          show ? Container() : trainMobile(screenSize.width),
                          show
                              ? Container()
                              : sportsCarMobile(screenSize.width),
                          show ? Container() : busMobile(screenSize.width),
                          show ? Container() : tractorMobile(screenSize.width),
                          show
                              ? Container()
                              : excavatorMobile(screenSize.width),
                          show ? Container() : truckMobile(screenSize.width),
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
                  !loading
                      ? SizedBox(
                    width: Utils.getVideoScreenWidth(screenSize),
                    height: Utils.getVideoScreenHeight(screenSize),
                    child: VideoPlayer(_timerVideoController),
                        )
                      : Container(),
                  show ? Container() : train(),
                  show ? Container() : sportsCar(),
                  show ? Container() : avgNarm(),
                  show ? Container() : bus(),
                  show ? Container() : tractor(),
                  show ? Container() : excavator(),
                  show ? Container() : truck(),
                  SizedBox(
                    width: Utils.getVideoScreenWidth(screenSize),
                    height: Utils.getVideoScreenHeight(screenSize),
                    child: Stack(
                      children: [
                        _buildingTransitionVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(
                                    _buildingTransitionVideoController),
                              )
                            : Container(),
                        _trainVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_trainVideoController),
                                ),
                              )
                            : Container(),
                        _sportsCarVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_sportsCarVideoController),
                                ),
                              )
                            : Container(),
                        _avgNarmVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_avgNarmVideoController),
                                ),
                              )
                            : Container(),
                        _busVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_busVideoController),
                                ),
                              )
                            : Container(),
                        _tractorVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_tractorVideoController),
                                ),
                              )
                            : Container(),
                        _excavatorVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_excavatorVideoController),
                                ),
                              )
                            : Container(),
                        _truckVideoPlaying
                            ? AnimatedOpacity(
                                opacity: _currentOpacity,
                                duration: Duration(seconds: 1),
                                child: SizedBox(
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
                                  child: VideoPlayer(_truckVideoController),
                                ),
                              )
                            : Container(),
                        // fading
                        //     ? AnimatedOpacity(
                        //         opacity: _currentOpacity,
                        //         duration: Duration(seconds: 1),
                        //         child: Container(
                        //           width: Utils.getVideoScreenWidth(screenSize),
                        //           height:
                        //               Utils.getVideoScreenHeight(screenSize),
                        //           child: Image.asset(
                        //             fadingImage,
                        //             fit: BoxFit.fill,
                        //           ),
                        //         ),
                        //       )
                        //     : Container(),
                      ],
                    ),
                  ),
                  loading
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: Image.network(
                            Vehicles_Still,
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
          Padding(
            padding:
                EdgeInsets.only(bottom: Utils.getBottomPadding(screenSize, 50)),
            child: Container(
              alignment: Alignment.centerLeft,
              height: screenSize.width * (0.2),
              child: showQR
                  ? TextAreaWithQRWithClip(
                      screenSize: screenSize,
                      width: width == 0 ? 0 : screenSize.width * (0.2),
                      height: screenSize.width * (0.2),
                    )
                  : Container(),
            ),
          ),
          showQR ? qrButton() : Container(),
          show ? Container() : qrButton(),
          // showTextAreaSmall && _avgNarmVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText: TextsConstants
          //                 .avgNarmTexts["TextAreaSmallWithClip"][0],
          //             description: TextsConstants
          //                 .avgNarmTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _truckVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText:
          //                 TextsConstants.truckTexts["TextAreaSmallWithClip"][0],
          //             description:
          //                 TextsConstants.truckTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _trainVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText:
          //                 TextsConstants.trainTexts["TextAreaSmallWithClip"][0],
          //             description:
          //                 TextsConstants.trainTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _busVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText:
          //                 TextsConstants.busTexts["TextAreaSmallWithClip"][0],
          //             description:
          //                 TextsConstants.busTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _tractorVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText: TextsConstants
          //                 .tractorTexts["TextAreaSmallWithClip"][0],
          //             description: TextsConstants
          //                 .tractorTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _sportsCarVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText: TextsConstants
          //                 .sportsCarTexts["TextAreaSmallWithClip"][0],
          //             description: TextsConstants
          //                 .sportsCarTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showTextAreaSmall && _excavatorVideoPlaying
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //             bottom: Utils.getBottomPadding(screenSize, 200)),
          //         child: Container(
          //           alignment: Alignment.bottomLeft,
          //           child: TextAreaSmallWithClip(
          //             width: screenSize.width * 0.35,
          //             screenSize: screenSize,
          //             prefixText: TextsConstants
          //                 .excavatorTexts["TextAreaSmallWithClip"][0],
          //             description: TextsConstants
          //                 .excavatorTexts["TextAreaSmallWithClip"][1],
          //           ),
          //         ),
          //       )
          //     : Container(),
          // showNext && screenSize.width >= ScreenSizes.Mobile.width && screenSize.height >= ScreenSizes.Mobile.height
          //     ? Positioned(
          //         right: 0,
          //         bottom: Utils.getBottomPadding(screenSize, 200),
          //         child: Container(
          //           alignment: Alignment.bottomRight,
          //           child: GestureDetector(
          //             onTap: () {
          //               switch (nextPage) {
          //                 case Pages.avgNarm:
          //                   customPushReplacement(
          //                       context,
          //                       AvgNArmVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.train:
          //                   customPushReplacement(
          //                       context,
          //                       TrainVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.excavator:
          //                   customPushReplacement(
          //                       context,
          //                       ExcavatorVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.sportsCar:
          //                   customPushReplacement(
          //                       context,
          //                       SportsCarVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.truck:
          //                   customPushReplacement(
          //                       context,
          //                       TruckVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.tractor:
          //                   customPushReplacement(
          //                       context,
          //                       TractorVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 case Pages.bus:
          //                   customPushReplacement(
          //                       context,
          //                       BusVideo(
          //                         from: Pages.vehicle,
          //                         offsetHor: offsetHor,
          //                         offsetVer: offsetVer,
          //                       ));
          //                   break;
          //                 default:
          //               }
          //               setState(() {
          //                 showNext = false;
          //               });
          //             },
          //             child: Container(
          //               width: screenSize.width *
          //                   0.091 *
          //                   Utils.getMultiplier(screenSize.width),
          //               height: screenSize.width *
          //                   0.040 *
          //                   Utils.getMultiplier(screenSize.width),
          //               decoration: const BoxDecoration(
          //                 image: DecorationImage(
          //                   image: AssetImage(nextImage),
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     : Container(),
        ],
      ),
    );
  }

  Widget qrButton() {
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
          onTap: () async {
            setShow();
            setState(() {
              timerOFF = true;
            });

            _timerVideoController.pause();

            setState(() {
              _buildingTransitionVideoPlaying = true;
            });

            setState(() {
              width = 0;
            });

            _buildingTransitionVideoController.play();

            setState(() {
              showTextAreaSmall = true;
            });

            await Future.delayed(const Duration(milliseconds: 200));

            setState(() {
              width = screenSize.width * 0.25;
            });
            _buildingTransitionVideoController.addListener(() {
              final bool isPlaying =
                  _buildingTransitionVideoController.value.isPlaying;
              print(isPlaying);
              if (isPlaying != _isPlaying) {
                setState(() {
                  _isPlaying = isPlaying;
                  setIndex(++index);
                });
                if (index > 1) {
                  _buildingTransitionVideoController.removeListener(() {});

                  // setState(() {
                  //   showNext = true;
                  //   nextPage = Pages.sportscar;
                  // });
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: showQR
                    ? const AssetImage(homeImage)
                    : const AssetImage(buildingsTransitionImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget avgNarm() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.38,
        top: Utils.getVideoScreenHeight(screenSize) * 0.585,
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
                  _avgNarmVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _avgNarmVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _avgNarmVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _avgNarmVideoController.addListener(() {
                  final bool isPlaying =
                      _avgNarmVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _avgNarmVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.avgNarm;
                      // });
                      customPushReplacement(
                          context,
                          AvgNArmVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: avgNarmTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget avgNarmMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: avgNarmTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _avgNarmVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _avgNarmVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _avgNarmVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.2;
        });

        _avgNarmVideoController.addListener(() {
          final bool isPlaying = _avgNarmVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _avgNarmVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.avgNarm;
              // });
              customPushReplacement(
                  context,
                  AvgNArmVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget train() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.82,
        top: Utils.getVideoScreenHeight(screenSize) * 0.56,
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
                    _trainVideoPlaying = true;
                  });

                  method();

                  await Future.delayed(Duration(seconds: 1));

                  // setState(() {
                  //   fading = false;
                  //   _currentOpacity = 0;
                  //   _trainVideoPlaying = true;
                  // });

                  setState(() {
                    width = 0;
                  });

                  _trainVideoController.play();

                  setState(() {
                    showTextAreaSmall = true;
                  });

                  await Future.delayed(const Duration(milliseconds: 200));

                  setState(() {
                    width = screenSize.width * 0.25;
                  });

                  _trainVideoController.addListener(() {
                    final bool isPlaying =
                        _trainVideoController.value.isPlaying;
                    print(isPlaying);
                    if (isPlaying != _isPlaying) {
                      setState(() {
                        _isPlaying = isPlaying;
                        setIndex(++index);
                      });
                      if (index > 1) {
                        _trainVideoController.removeListener(() {});

                        // setState(() {
                        //   showNext = true;
                        //   nextPage = Pages.train;
                        // });
                        customPushReplacement(
                            context,
                            TrainVideo(
                              from: Pages.vehicle,
                              offsetHor: offsetHor,
                              offsetVer: offsetVer,
                            ));
                      }
                    }
                  });
                },
                child: CustomButtonLabelWithClip(
                  screenSize: screenSize,
                  text: trainTexts["topic"],
                  type: 0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget trainMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: trainTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _trainVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _trainVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _trainVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });

        _trainVideoController.addListener(() {
          final bool isPlaying = _trainVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _trainVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.train;
              // });
              customPushReplacement(
                  context,
                  TrainVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget sportsCar() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.14,
        top: Utils.getVideoScreenHeight(screenSize) * 0.425,
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
                  _sportsCarVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _sportsCarVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _sportsCarVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });
                _sportsCarVideoController.addListener(() {
                  final bool isPlaying =
                      _sportsCarVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _sportsCarVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.sportscar;
                      // });
                      customPushReplacement(
                          context,
                          SportsCarVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: sportsCarTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget sportsCarMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: sportsCarTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _sportsCarVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _sportsCarVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _sportsCarVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });
        _sportsCarVideoController.addListener(() {
          final bool isPlaying = _sportsCarVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _sportsCarVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.sportsCar;
              // });
              customPushReplacement(
                  context,
                  SportsCarVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget tractor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.36,
        top: Utils.getVideoScreenHeight(screenSize) * 0.3,
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
                  _tractorVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _tractorVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _tractorVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

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
                      _tractorVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.tractor;
                      // });
                      customPushReplacement(
                          context,
                          TractorVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: tractorTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget tractorMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: tractorTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _tractorVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _tractorVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _tractorVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });

        _tractorVideoController.addListener(() {
          final bool isPlaying = _tractorVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _tractorVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.tractor;
              // });

              customPushReplacement(
                  context,
                  TractorVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget bus() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.56,
        top: Utils.getVideoScreenHeight(screenSize) * 0.28,
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
                  _busVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _busVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _busVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _busVideoController.addListener(() {
                  final bool isPlaying = _busVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _busVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.bus;
                      // });
                      customPushReplacement(
                          context,
                          BusVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: busTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget busMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: busTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _busVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _busVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _busVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });

        _busVideoController.addListener(() {
          final bool isPlaying = _busVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _busVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.bus;
              // });
              customPushReplacement(
                  context,
                  BusVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget excavator() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.75,
        top: Utils.getVideoScreenHeight(screenSize) * 0.315,
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
                  _excavatorVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _excavatorVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _excavatorVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _excavatorVideoController.addListener(() {
                  final bool isPlaying =
                      _excavatorVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _excavatorVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.excavator;
                      // });
                      customPushReplacement(
                          context,
                          ExcavatorVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: excavatorTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget excavatorMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: excavatorTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _excavatorVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _excavatorVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _excavatorVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });

        _excavatorVideoController.addListener(() {
          final bool isPlaying = _excavatorVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _excavatorVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.excavator;
              // });
              customPushReplacement(
                  context,
                  ExcavatorVideo(
                    from: Pages.vehicle,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                  ));
            }
          }
        });
      },
    );
  }

  Widget truck() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.62,
        top: Utils.getVideoScreenHeight(screenSize) * 0.51,
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
                  _truckVideoPlaying = true;
                });

                method();

                await Future.delayed(Duration(seconds: 1));

                // setState(() {
                //   fading = false;
                //   _currentOpacity = 0;
                //   _truckVideoPlaying = true;
                // });

                setState(() {
                  width = 0;
                });

                _truckVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _truckVideoController.addListener(() {
                  final bool isPlaying = _truckVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _truckVideoController.removeListener(() {});

                      // setState(() {
                      //   showNext = true;
                      //   nextPage = Pages.truck;
                      // });
                      customPushReplacement(
                          context,
                          TruckVideo(
                            from: Pages.vehicle,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: truckTexts["topic"],
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget truckMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: truckTexts["topic"],
      onPressed: () async {
        setShow();
        setState(() {
          timerOFF = true;
        });

        _timerVideoController.pause();

        setState(() {
          _truckVideoPlaying = true;
        });

        method();

        await Future.delayed(Duration(seconds: 1));

        // setState(() {
        //   fading = false;
        //   _currentOpacity = 0;
        //   _truckVideoPlaying = true;
        // });

        setState(() {
          width = 0;
        });

        _truckVideoController.play();

        setState(() {
          showTextAreaSmall = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));

        setState(() {
          width = screenSize.width * 0.25;
        });

        _truckVideoController.addListener(() {
          final bool isPlaying = _truckVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _truckVideoController.removeListener(() {});

              // setState(() {
              //   showNext = true;
              //   nextPage = Pages.truck;
              // });
              customPushReplacement(
                  context,
                  TruckVideo(
                    from: Pages.vehicle,
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
