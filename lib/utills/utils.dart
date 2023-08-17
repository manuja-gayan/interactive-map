import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interactive_map/constants/constants.dart';

class Utils {
  static double getVideoScreenWidth(Size screenSize) {
    if (screenSize.width / screenSize.height <
        VideoAspectRatio.width / VideoAspectRatio.height) {
      return VideoAspectRatio.width *
          (screenSize.height / VideoAspectRatio.height);
    } else {
      return screenSize.width;
    }
  }

  static double getVideoScreenHeight(Size screenSize) {
    if (screenSize.width / screenSize.height <
        VideoAspectRatio.width / VideoAspectRatio.height) {
      return screenSize.height;
    } else {
      return VideoAspectRatio.height *
          (screenSize.width / VideoAspectRatio.width);
    }
  }

  static double getMultiplier(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 1.5;
    } else if (width < 1000) {
      return 1;
    } else {
      return 1;
    }
  }

  static double getTopRightButtonMultiplier(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 2.5;
    } else if (width < 1000) {
      return 1;
    } else {
      return 1;
    }
  }

  static double getTopicTextSize(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 50;
    } else if (width < 1000) {
      return 60;
    } else {
      return 75;
    }
  }

  static double getVerticleDeviderHeight(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 50;
    } else if (width < 1000) {
      return 70;
    } else {
      return 100;
    }
  }

  static double getIconResizeRatio(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 0.4;
    } else if (width < 1000) {
      return 0.6;
    } else {
      return 1.2;
    }
  }

  static double getIconTopPaddingRatio(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 0;
    } else if (width < 700) {
      return 0.3;
    } else if (width < 1300) {
      return 0.5;
    } else {
      return 1;
    }
  }

  static double getTextPaddingRatio(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 0.2;
    } else if (width < 700) {
      return 0.4;
    } else if (width < 900) {
      return 0.6;
    } else if (width < 1300) {
      return 0.8;
    } else {
      return 1;
    }
  }

  static double getCustomTextContainerMultiplier(double width) {
    if (width < ScreenSizes.Mobile.width) {
      return 3;
    } else if (width < 800) {
      return 1;
    } else if (width < 1000) {
      return 1;
    } else if (width < 1400) {
      return 1;
    } else {
      return 1;
    }
  }

  static double getBottomPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.height / VideoAspectRatio.height);
    if (screenSize.height < ScreenSizes.Mobile.height &&
        screenSize.width < ScreenSizes.Mobile.width) {
      return screenSize.height * 0.3 + transformedPadding;
    }
    if (screenSize.height < ScreenSizes.Mobile.height) {
      return transformedPadding;
    }
    if (screenSize.width < ScreenSizes.Mobile.width) {
      return screenSize.width * 0.3 + transformedPadding;
    } else {
      return transformedPadding - transformedPadding * 0.5;
    }
  }

  static double getRightPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.width / VideoAspectRatio.width);
    if (screenSize.height < ScreenSizes.Mobile.height &&
        screenSize.width < ScreenSizes.Mobile.width) {
      return transformedPadding;
    }
    if (screenSize.height < ScreenSizes.Mobile.height) {
      return screenSize.width * 0.3 + transformedPadding;
    }
    if (screenSize.width < ScreenSizes.Mobile.width) {
      return transformedPadding;
    } else {
      return transformedPadding;
    }
  }

  static double getTopPadding(Size screenSize, double padding) {
    double transformedPadding =
        padding * (screenSize.height / VideoAspectRatio.height);
    return transformedPadding;
  }

  static void enterFullScreenMode() {
    document.documentElement?.requestFullscreen();
  }

  static Future<Map<String, dynamic>> readJson(String fileName) async {
    final String response = await rootBundle.loadString(fileName);
    final data = await json.decode(response);

    return data;
  }
}
