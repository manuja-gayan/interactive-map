import 'package:flutter/material.dart';

class AppColors {
  //colors
  static const Color white = Colors.white;

//Primary Palette
  static const Color night = Color(0xFF263349);
  static const Color sea = Color(0xFF003C71);
  static const Color seaLight = Color.fromARGB(255, 56, 167, 231);

//Gradients
  static const LinearGradient seaToSky = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      sea,
      sky,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );
  static const LinearGradient fogToWhite = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      fog,
      white,
    ], // red to yellow
    tileMode: TileMode.clamp,
  );

//Secondary Palette
  static const Color fern = Color(0xFFCDDF4A);
  static const Color sky = Color(0xFF006AA6);

//Neutral Palette
  static const Color ash = Color(0xFF4D4D4D);
  static const Color smoke = Color(0xFFCCCCCC);
  static const Color fog = Color(0xFFEFEFEF);
}

//assets links
const homeImage = 'assets/graphics/HOME.png';
const moreImage = 'assets/graphics/MORE.png';
const nextImage = 'assets/graphics/Next.png';
const buildingsTransitionImage = 'assets/graphics/Buildings.png';
const vehiclesTransitionImage = 'assets/graphics/Vehicles.png';

const Vehicles_Still =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fvehicles%2FVehicles_Still.jpg?alt=media&token=586f2d6d-71fc-4a60-a928-27218a6c3fd5";
const Buildings_menu_still =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2FBuildings_menu_still.png?alt=media&token=4549295d-f6c2-4367-9f61-fad6eb5d796f";

const dataAnimationGif = 'assets/animations/Data_animation_512.gif';
const dataCenterAirFlowGif = 'assets/animations/Data_Center_airflow.gif';

const bank_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbank_plain.png?alt=media&token=da5efaa0-a882-45c9-bd18-1c75ac0085dd";
const barn_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbarn_Plain.png?alt=media&token=9a1c6e21-3e5e-48aa-aa8a-a5211dced07b";
const datacentre_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fdatacentre_plain.png?alt=media&token=f6ee134e-7260-4ca7-920b-702050f1b31f";
const fastfood_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Ffastfood_plain.png?alt=media&token=956a0e72-942a-407f-8817-e7841564f431";
const groceryshop_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fgroceryshop_plain.png?alt=media&token=a196146f-341a-4650-9248-68086a97f54e";
const retail_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fretail_plain.png?alt=media&token=a65a180a-70b9-4e11-98eb-0f54011f0b71";
const School_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2FSchool_Plain.png?alt=media&token=5d5c0951-b2fd-497c-b51c-5c8a3f4b417f";
const warehouse_Plain =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fwarehouse_plain.png?alt=media&token=4ce107c3-0e51-4153-8ca9-7d5bf725b14c";
const barn_ipad_1 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbarn_ipad_1.png?alt=media&token=c9c6c8d3-f089-48e8-8105-eef5b9ddf6a2";
const barn_ipad_2 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbarn_ipad_2.png?alt=media&token=54e8e201-cf9f-40f5-bb28-169c205e38a6";
const barn_ipad_3 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbarn_ipad_3.png?alt=media&token=a73b6697-bc9d-4b74-a6fe-dc336a4e2927";
const barn_ipad_4 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fbarn_ipad_4.png?alt=media&token=5f170216-22c5-40ff-9463-55704a149e88";
const screen_MAIN =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_MAIN.png?alt=media&token=fd4a3dee-68c4-4b9f-8697-5882843f4d23";
const screen_LEFT =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_LEFT.png?alt=media&token=52440807-86d5-485a-ab57-9ce82400febc";
const screen_LEFT_2 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_LEFT_2.png?alt=media&token=87dd99d7-902b-4e76-a304-55d31b76e38c";
const screen_LEFT_3 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_LEFT_3.png?alt=media&token=ed16426e-7ce3-4bfc-9583-7ed0737e7714";
const screen_RIGHT =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_RIGHT.png?alt=media&token=7ae8c76c-76a5-4cf6-b4a6-886d3bb3027a";
const screen_RIGHT_2 =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2Fbuildings%2Fscreen_RIGHT_2.png?alt=media&token=7c0cde93-3be2-4fc0-a57a-4d05de55bbf0";

const Intro_still =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fimages%2FIntro_still.png?alt=media&token=bae1d848-57be-4806-a92c-d7065d605d76";

//bucket base paths
const BASE_URL = "https://firebasestorage.googleapis.com";
const MOKIO_BASE_URL = "run.mocky.io";
//'https://storage.cloud.google.com/pm-im-co-uk.appspot.com/assets/2022-09-23/';

//Text files
const BANK_TEXT = "v3/e4fabe78-65e4-445a-8364-de0e739be22f";
const DAIRYBARNS_TEXT = "v3/7ec5340f-8f46-4a9d-98d7-20b91215ef5a";
const DATACENTRE_TEXT = "v3/5990127f-3e5c-40da-b354-705a7be70789";
const FASTFOOD_TEXT = "v3/8264b320-e042-4331-be56-3d0d2d732bee";
const GROCERYSHOP_TEXT = "v3/6374b50a-0b46-4c27-ad63-0f45e2e78f38";
const RETAIL_TEXT = "v3/da3488e1-1a97-4ec0-b8d3-49a80b6f44f2";
const SCHOOL_TEXT = "v3/c8f94498-cf85-4434-a7c6-ea8775e67da7";
const WAREHOUSE_TEXT = "v3/a8e718cd-0145-48f9-8ea1-06a3cde46650";

const AVGNRM_TEXT = "v3/ba48059d-4eb1-4a72-b739-aa1d1856b6cf";
const BUS_TEXT = "v3/44aa8ba2-4bc0-404d-a61f-342609464dfa";
const EXCAVATOR_TEXT = "v3/7fd8bc27-0054-4797-a746-7e21d8a261c9";
const SPORTSCAR_TEXT = "v3/39cd68d3-168b-4026-8b06-66d877ff8c6c";
const TRACTOR_TEXT = "v3/9ec5d20f-354d-491b-a897-063b4fb01265";
const TRAIN_TEXT = "v3/3f5cb447-433b-4e0a-bce7-347b2171d89b";
const TRUCK_TEXT = "v3/41e6730a-4eb2-44eb-8fd3-f29d04e1f75c";

//video links
//home screen
const Intro_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_Loop.mp4?alt=media&token=de146609-1578-4222-9d03-faed32cea9b4";
const Intro_to_Buildings =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_to_Buildings.mp4?alt=media&token=8a047807-c526-45e0-a294-3a85e1d4be26";
const Intro_to_Vehicles =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2FIntro_to_Vehicles.mp4?alt=media&token=cf34c004-9f48-4e16-8090-0df01e6ffa3f";

//building videos
const barn_ipad_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_ipad_REV.mp4?alt=media&token=3f1a2ca0-02df-4653-a2f4-6e8f13fd046d";
const motor_MAIN =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fmotor_MAIN.mp4?alt=media&token=6cc43264-22f6-420a-b6b7-ca7633f4260d";
const TX_MAIN =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2FTX_MAIN.mp4?alt=media&token=9d2c1fb9-6782-45bc-b579-1035da6eec2a";
const screen_LEFT_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fscreen_LEFT_REV.mp4?alt=media&token=98b46d01-2528-4b5e-9183-73754d7fb79e";
const screen_RIGHT_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fscreen_RIGHT_REV.mp4?alt=media&token=4a796532-7634-41b8-a56d-b823128baa57";
const screen_LEFT_FW =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fscreen_LEFT.mp4?alt=media&token=37ab6120-07d6-4c4e-9ef9-41844ec9d7a2";
const screen_RIGHT_FW =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fscreen_RIGHT.mp4?alt=media&token=bb061e24-cdb4-458c-b818-0dcfeaaad65c";

//building home screen
const Buildings_Main =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2FBuildings_Main.mp4?alt=media&token=9a092883-38a8-4934-961a-7535bf59e484";
const bank_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fbank.mp4?alt=media&token=621c5254-06a3-4417-a6bd-a190533edb2b";
const datacentre_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fdatacentre.mp4?alt=media&token=8f8b9681-66ae-4014-82ba-4d0c769fb41a";
const school_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fschool.mp4?alt=media&token=3030484b-81de-4e9a-a7b3-db255da2373d";
const retail_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fretail.mp4?alt=media&token=45fae3d4-9921-4f63-b092-5f6472bcd132";
const warehouse_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fwarehouse.mp4?alt=media&token=f66dcb93-17fc-4e38-934a-9d1f89bdc81e";
const groceryshop_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fgroceryshop.mp4?alt=media&token=0a9ff35a-cff4-459e-b760-1afaeea7258a";
const fastfood_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Ffastfood.mp4?alt=media&token=970b8755-509f-4a34-8951-1a6b2bd024b4";
const barn_home =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2Fbarn.mp4?alt=media&token=9f83c68e-95f1-4722-bd33-9d5d46cce983";
const Buildings_To_Vehicles =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbuilding%20home%2FBuildings_To_Vehicles.mp4?alt=media&token=35671a38-c03d-4ce0-8ac0-19c71f1d423c";

//bank screen
const bank_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_REV.mp4?alt=media&token=b0ece572-68f5-4ea5-80a3-ec42c0fb622c";
const bank_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_MOTOR.mp4?alt=media&token=94d2111c-ac91-4229-80b7-899a0891c19e";
const bank_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbank_MAP.mp4?alt=media&token=5cfb6c12-7239-42d2-8d05-4617203c33d8";

//dairy barns screen
const barn_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_REV.mp4?alt=media&token=202218f4-a202-4f65-a758-e64517ba0b02";
const barn_to_TXMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_to_TXMotor.mp4?alt=media&token=bd75d294-7677-43eb-83df-5b0a023e6b17";
const barn_To_Tractor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_To_Tractor.mp4?alt=media&token=4de0f6fc-2a69-47f1-80da-31a3bcd66bb0";
const barn_ipad =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fbarn_ipad.mp4?alt=media&token=7c2de2aa-2cd5-46c0-9358-eb93971f5da8";

//datacentre screen
const datacentre_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fdatacentre_REV.mp4?alt=media&token=2b820f19-4b30-4406-bde6-3ea36596def0";
const datacentre_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fdatacentre_MOTOR.mp4?alt=media&token=9062b3b2-5a8d-4e9a-ae83-0a6ecb5e21a7";
const datacentre_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fdatacentre_MAP.mp4?alt=media&token=7f04cb2e-8a50-4294-9874-04fca54a631f";

//fastfood screen
const fastfood_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Ffastfood_REV.mp4?alt=media&token=632f7cca-4cff-4979-9544-86d50be1e33d";
const fastfood_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Ffastfood_MOTOR.mp4?alt=media&token=13e9bb80-1337-4621-a3e4-9e5a4cc2dab0";
const fastfood_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Ffastfood_MAP.mp4?alt=media&token=658ff092-5b91-4d8b-8d6c-1da46b45111a";

//groceryshop screen
const groceryshop_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fgroceryshop_REV.mp4?alt=media&token=6d9e55d1-1f2a-4536-9738-c323bea67f6d";
const groceryshop_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fgroceryshop_MOTOR.mp4?alt=media&token=3f1d6e8c-94c6-4b38-bc58-4026d13ffc2b";
const groceryshop_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fgroceryshop_MAP.mp4?alt=media&token=cc41d7a5-5402-4a14-b742-179f3fb3e5c0";

//retail screen
const retail_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fretail_REV.mp4?alt=media&token=e7ccc995-14ca-4db1-b17e-4781d3635b3d";
const retail_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fretail_MOTOR.mp4?alt=media&token=c2283214-7d31-4a0d-a4d9-f68cb0ffd1d4";
const retail_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fretail_MAP.mp4?alt=media&token=70e0c50b-0a38-41bf-8fae-e95c6558aa30";

//school screen
const school_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fschool_REV.mp4?alt=media&token=272c9d0a-b96c-4d6f-889f-3fc85c67ba07";
const school_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fschool_MOTOR.mp4?alt=media&token=321e23ee-4db2-48df-9535-6edf9ef015b8";
const school_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fschool_MAP.mp4?alt=media&token=5cccbbce-00a4-4848-9fb9-06f549c0c324";

//warehouse screen
const warehouse_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fwarehouse_REV.mp4?alt=media&token=75482b7b-48aa-46ca-b097-4a197f99eb73";
const warehouse_MOTOR =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fwarehouse_MOTOR.mp4?alt=media&token=3752cbcf-c49a-4781-a05a-115bb659f7ab";
const warehouse_MAP =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fbuildings%2Fwarehouse_MAP.mp4?alt=media&token=65c864c4-6daa-4a8a-bc80-0682bd335fb5";

//vehicle videos
const Battery_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FBattery_Loop.mp4?alt=media&token=b06a1716-e080-48cc-94d9-461a95b90c31";
const DCDC_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FDCDC_Loop.mp4?alt=media&token=b8f049e9-5b3c-459c-abea-ea1edc83dc11";
const Drive_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FDrive_Loop.mp4?alt=media&token=b62a4286-7045-438a-bb6a-700f48e66cac";
const Fan_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FFan_Loop.mp4?alt=media&token=e0f59423-8ee2-4120-94e6-83895d2af73d";
const HDMotor_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FHDMotor_Loop.mp4?alt=media&token=e1c4e58f-3679-4ebe-8006-8ec440fd97c2";
const Inverter_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FInverter_Loop.mp4?alt=media&token=5d4482cd-70da-4500-8358-812eeee8c120";
const Train_Battery_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_loops%2FTrain_Battery_Loop.mp4?alt=media&token=2a5b84e6-49bd-41fa-b927-03a5f6e6221d";

//vehicle home screen
const Vehicles_Main_Loop =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVehicles_Main_Loop.mp4?alt=media&token=9b9b0149-ca17-464b-86e9-77e3e02078a7";
const Veh_To_Train =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Train.mp4?alt=media&token=86da575f-b328-496a-9c51-842c806406b8";
const Veh_To_Car =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Car.mp4?alt=media&token=70ea51af-c880-4764-ba00-4a2014f37cdd";
const Veh_To_AGV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_AGV.mp4?alt=media&token=8716ce5f-50b8-48df-b095-8bf0df9f0194";
const Veh_To_Bus =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Bus.mp4?alt=media&token=ad2991c0-7ab5-4aaf-8d49-86e34eb35837";
const Veh_To_Tractor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Tractor.mp4?alt=media&token=fdbc8735-bdc7-4ee2-9f46-6f6482c35dfd";
const Veh_To_Exc =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Exc.mp4?alt=media&token=7a672edd-2555-4168-9741-78c6804c9f6e";
const Veh_To_Truck =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVeh_To_Truck.mp4?alt=media&token=c6af75df-1b57-488e-8471-a8d9f9ebdf59";
const Vehicles_To_Buildings =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2Fvehicle%20home%2FVehicles_To_Buildings.mp4?alt=media&token=1c7b1276-b39f-4b10-b5ad-7b64f5221bbb";

//avg nrm screen
const Veh_To_AGV_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_AGV_REV.mp4?alt=media&token=538c0c05-9fb6-47e3-8ad9-cc1b477da1fc";
const AGV_To_Battery =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FAGV_To_Battery.mp4?alt=media&token=b6bfac4d-c398-4b8f-97bd-3bc2b9b71c99";

//bus screen
const Veh_To_Bus_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Bus_REV.mp4?alt=media&token=99d42a4b-f2f9-4021-8937-c2a5648382a7";
const Bus_To_Fan =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_Fan.mp4?alt=media&token=903def28-d4bd-40e8-b948-1e88f1532373";
const Bus_To_Inverter =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_Inverter.mp4?alt=media&token=50c69c68-6d58-4ac7-a9d7-ca2ed4f5a881";
const Bus_To_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FBus_To_HDMotor.mp4?alt=media&token=9e367ef7-2049-4334-8747-3aaa5d27826b";

//excavator screen
const Veh_To_Exc_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Exc_REV.mp4?alt=media&token=ad7c875b-1789-430b-aeea-ba239f487be0";
const Exc_to_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FExc_to_HDMotor.mp4?alt=media&token=697697f6-551d-43f2-a296-eb2487b2a27e";
const Exc_to_Battery =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FExc_to_Battery.mp4?alt=media&token=2988123f-a997-44f4-8d2a-f055aaa9b0a3";
const Exc_to_Drive =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FExc_to_Drive.mp4?alt=media&token=af61aa13-7b6a-437a-ae69-a7554ceb906a";
const Exc_to_DCDC =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FExc_to_DCDC.mp4?alt=media&token=c6fb85f2-51e5-4328-a89d-658caa99eff7";

//sportscar screen
const Veh_To_Car_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Car_REV.mp4?alt=media&token=6f54bfec-9a3f-464b-85fe-5b98d7027aae";
const Car_To_Inverter =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FCar_To_Inverter.mp4?alt=media&token=9a9dd98d-fe41-4d2c-9dc8-0e119382c814";
const Car_To_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FCar_To_HDMotor.mp4?alt=media&token=a0c24315-d35e-4bec-9b54-f15e9d70cdae";

//tractor screen
const Veh_To_Tractor_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Tractor_REV.mp4?alt=media&token=9b0f9f89-0c02-4b48-8697-9ba266d59548";
const Tractor_To_Fan =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTractor_To_Fan.mp4?alt=media&token=be524478-a62e-46d3-8562-d97d1ac0dd0f";
const Tractor_To_Inverter =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTractor_To_Inverter.mp4?alt=media&token=a48a9935-75c4-4023-bd39-aaa3efa4df36";
const Tractor_To_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTractor_To_HDMotor.mp4?alt=media&token=32717399-320a-490b-ae5b-d2d0a2f0fb16";

//train screen
const Veh_To_Train_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Train_REV.mp4?alt=media&token=1ada0bf1-b3c7-4ca4-b172-b8c14f064944";
const Train_To_Battery =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTrain_To_Battery.mp4?alt=media&token=5f2354cf-8ee5-46e7-a991-36107e2d256d";

//truck screen
const Veh_To_Truck_REV =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FVeh_To_Truck_REV.mp4?alt=media&token=7b7fabc6-f0d8-4831-b023-8f3b32174014";
const Truck_To_Fan =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTruck_To_Fan.mp4?alt=media&token=f1fa8a03-7076-4f34-bda1-09699afc9509";
const Truck_To_Inverter =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTruck_To_Inverter.mp4?alt=media&token=11255ba9-b26a-402b-8e97-bce06203cf65";
const Truck_To_HDMotor =
    "https://firebasestorage.googleapis.com/v0/b/my-project-1-1c137.appspot.com/o/assets%2Fvideos%2Fvehicles%2FProduct_transition%2FTruck_To_HDMotor.mp4?alt=media&token=76ecd762-59bd-4df1-b2c3-7dc5d9165f1a";

//pages
class Pages {
  static const home = 'home';

  static const buildings = 'buildings';
  static const motor = 'motor';
  static const motorToHome = 'motorToHome';
  static const map = 'map';
  static const ipad = 'ipad';

  static const school = 'Schools';
  static const bank = 'bank';
  static const grocery = 'grocery';
  static const dataCenter = 'dataCenter';
  static const fastfoods = 'fastfoods';
  static const werehouse = 'werehouse';
  static const retail = 'retail';
  static const dairyBarns = 'dairyBarns';

  static const vehicle = 'vehicle';
  static const transition = 'transition';
  static const transitionPageToHome = 'transitionPageToHome';
  // static const map = 'map';

  static const avgNarm = 'avgNarm';
  static const train = 'train';
  static const excavator = 'excavator';
  static const sportsCar = 'sportsCar';
  static const truck = 'truck';
  static const tractor = 'tractor';
  static const bus = 'bus';
}

//fonts
class Fonts {
  static const black = "Barlow-Black";
  static const blackItalic = "Barlow-BlackItalic";
  static const bold = "Barlow-Bold";
  static const boldItalic = "Barlow-BoldItalic";
  static const extraBold = "Barlow-ExtraBold";
  static const extraBoldItalic = "Barlow-ExtraBoldItalic";
  static const extraLight = "Barlow-ExtraLight";
  static const extraLightItalic = "Barlow-ExtraLightItalic";
  static const iitalic = "Barlow-Italic";
  static const light = "Barlow-Light";
  static const lightItalic = "Barlow-LightItalic";
  static const medium = "Barlow-Medium";
  static const mediumItalic = "Barlow-MediumItalic";
  static const regular = "Barlow-Regular";
  static const semiBold = "Barlow-SemiBold";
  static const semiBoldItalic = "Barlow-SemiBoldItalic";
  static const thin = "Barlow-Thin";
  static const thinItalic = "Barlow-ThinItalic";
}

//VideoAspect Ratio
class VideoAspectRatio {
  static const width = 1920.0;
  static const height = 1080.0;
}

//VideoAspect Ratio
class ScreenSizes {
  static const Size Mobile = Size(500, 300);
}

// Application texts
class TextsConstants {
  // static const Map<String, dynamic> schoolTexts = {
  //   "topic": "Schools",
  //   "TextAreaSmallWithClip": [
  //     "64%",
  //     "of energy in schools is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Schools",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       // ["TOPIC", "Energy savings", ":"],
  //       ["DECORATEDTEXT", "Energy Savings:", " 87% baseline motor"],
  //       ["DECORATEDTEXT", "Energy Savings:", " 34% VFD retrofits"],
  //       ["DECORATEDTEXT", "Time to payback:", " 3.1 years"],
  //     ],
  //     "topic": "Leading National University",
  //     "description": "School Gymnasium",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> fastFoodTexts = {
  //   "topic": "Quick Serve Restaurants",
  //   "TextAreaSmallWithClip": [
  //     "28%",
  //     "HVAC represents 28% of a restaurant's energy costs on average",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Restaurants",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Energy reduction:", " 70% annually"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$2.3K per location"],
  //       ["DECORATEDTEXT", "Energy saved:", " 19,174 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.6 years"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/09/TT-Case-Study-Five-Guys_v04TL.pdf"
  //       ],
  //     ],
  //     "topic": "Five Guys",
  //     "description": "Quick Serve Restaurant",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> bankTexts = {
  //   "topic": "Banks",
  //   "TextAreaSmallWithClip": [
  //     "40-60%",
  //     "of energy in bank branches is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Banks",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Locations:", " 300+"],
  //       ["DECORATEDTEXT", "Energy reduction:", " 15%"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$500k"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/10/Case-Study-Fifth-Third-Bank_v07.pdf"
  //       ],
  //     ],
  //     "topic": "Fifth Third Bank",
  //     "description": "Retail branch locations",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> retailTexts = {
  //   "topic": "Retail Stores",
  //   "TextAreaSmallWithClip": [
  //     "70%",
  //     "of energy in retail is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Retail Stores",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Locations:", " 400+"],
  //       ["DECORATEDTEXT", "Energy reduction:", " 60% annually"],
  //       // ["DECORATEDTEXT", "Annual savings:", " \$K per location"],
  //       // ["DECORATEDTEXT", "Energy saved:", " KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 3 years"],
  //       // [
  //       //   "HYPERLINK",
  //       //   "Case Study Link",
  //       //   "https://turntide.com/wp-content/uploads/2022/08/Case-Study-Ivanhoe-Cambridge_v04.pdf"
  //       // ],
  //     ],
  //     "topic": "Wilko",
  //     "description": "Retail Stores",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> warehouseTexts = {
  //   "topic": "Warehouses",
  //   "TextAreaSmallWithClip": [
  //     "75%",
  //     "of energy in warehouses and distribution centers is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Warehouses",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Motor energy savings:", " 78%"],
  //       ["DECORATEDTEXT", "Energy saved annually:", " 224,162 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.4 years"],
  //     ],
  //     "topic": "Ecommerce Warehouse",
  //     "description": "Major Distribution and Fulfillment Center",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> dataCentreTexts = {
  //   "topic": "Data Centers",
  //   "TextAreaSmallWithClip": [
  //     "37%",
  //     "of energy in data centers is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Data Centers",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Fan energy savings:", " 25%"],
  //       ["DECORATEDTEXT", "Energy savings:", " 1 Million+ KWH"],
  //       ["DECORATEDTEXT", "Energy rebate: ", " Qualified for \$200K"],
  //     ],
  //     "topic": "Large Data Center",
  //     "description": "Air-cooled hot/cold aisle design",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> groceryShopTexts = {
  //   "topic": "Grocery Stores",
  //   "TextAreaSmallWithClip": [
  //     "50%",
  //     "of energy in grocery stores is consumed by HVAC and lighting",
  //   ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       // ["TEXT", "Smart Motor System"],
  //       // ["TEXT", "Smart HVAC"],
  //       // ["TEXT", "Smart Building Operations"],
  //     ],
  //     "topic": "Turntide for Grocery Stores",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [
  //       ["DECORATEDTEXT", "Energy reduction:", " 75% annually"],
  //       ["DECORATEDTEXT", "Annual savings:", " \$18.4K per location"],
  //       ["DECORATEDTEXT", "Energy saved:", " 153,649 KWH"],
  //       ["DECORATEDTEXT", "Time to payback:", " 1.37 years"],
  //       [
  //         "HYPERLINK",
  //         "Read Case Study >",
  //         "https://turntide.com/wp-content/uploads/2021/09/TT-Case-Study-Sprouts_v04TL.pdf"
  //       ],
  //     ],
  //     "topic": "Sprouts",
  //     "description": "Grocery Store",
  //   },
  //   "subTopics": [
  //     "Smart Motor System ™",
  //     "Case Study",
  //     "Turntide App",
  //   ],
  // };
  // static const Map<String, dynamic> dairyBarnsTexts = {
  //   "topic": "Dairy Barns",
  //   // "TextAreaSmallWithClip": [
  //   //   "X%",
  //   //   "Barn statistics",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide Intelligent Barn",
  //     "description":
  //         "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights",
  //   },
  //   "TextAreaWithClipEnergySaving": {
  //     "texts": [],
  //     "topic": "",
  //     "description": "",
  //   },
  //   "subTopics": [
  //     "TX Motor",
  //     "DairyBOS®",
  //     "Tractors",
  //   ],
  // };

  // static const Map<String, dynamic> sportsCarTexts = {
  //   "topic": "Sports Cars",
  //   // "TextAreaSmallWithClip": [
  //   //   "64%",
  //   //   "of energy in sports Car is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for EVs",
  //     "description":
  //         "High performance motors and inverters featuring class leading power density (35kW/l for inverters, 6kW/kg for motors) and high levels of functional safety.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //     "Prevent learning disruption",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> tractorTexts = {
  //   "topic": "Tractors",
  //   // "TextAreaSmallWithClip": [
  //   //   "28%",
  //   //   "of tractor energy costs are from HVAC on avarage",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Tractors",
  //     "description":
  //         "We'll deliver the intelligence, efficiency, and controls you need to build industry-leading vehicles, from tractors to combines, for years to come.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> avgNarmTexts = {
  //   "topic": "Material Handling",
  //   // "TextAreaSmallWithClip": [
  //   //   "40-60%",
  //   //   "of energy in AGV / AMR branches is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Material Handling",
  //     "description":
  //         "/We offer Lithium-ion batteries to increase the productivity of your warehouse or distribution center material handling equipment by minimizing downtime and taking advantage of opportunity charging.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Battery Packs",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Performance Lithium-ion NMB battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "Series system voltage"},
  //         {"topic": "4.97-700kWh", "description": "Capacity"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> truckTexts = {
  //   "topic": "Trucks",
  //   // "TextAreaSmallWithClip": [
  //   //   "70%",
  //   //   "of energy in Truck is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Trucks",
  //     "description":
  //         "From last-mile delivery to Class8 40T trucks, we offer a range of highly reliable electrification solutions from high power electrified traction motors and drives to low power pumps, fans, and hotel loads to help you deliver your emissions targets.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> busTexts = {
  //   "topic": "Buses",
  //   // "TextAreaSmallWithClip": [
  //   //   "75%",
  //   //   "of energy in Buses is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [],
  //     "topic": "Turntide for Electric Buses",
  //     "description":
  //         "We offer powertrain systems to satisfy on-road functional safety to ISO26262 ASIL-D with all the power and torque you need.\n\nSelect from a range of low voltage and high voltage pump and fan cooling solutions.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Fan assemblies",
  //     "Inverters",
  //     "Motors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "Pump & Fan Assemblies",
  //       "subTopic": "",
  //       "descriptioTexts": [
  //         [
  //           "TEXT",
  //           "Electric pump and fan assemblies from 500W to 60kW cooling solutions for electrified powertrain"
  //         ],
  //         [
  //           "TEXT",
  //           "Sealless electric water pumps efficiently operate EV cooling circuits"
  //         ],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Fans.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "24 / 48 / 750V", "description": "OPERATING VOLTAGE"},
  //         {"topic": "500-60kW", "description": "POWER OUTPUT"}
  //       ],
  //     },
  //     {
  //       "topic": "High Voltage High Power Inverters",
  //       "subTopic":
  //           "Commercially available design for any automotive application",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven design allows fast implementation"],
  //         ["TEXT", "Reduction in validation test programs"],
  //         ["TEXT", "ISO26262 ASIL-D guaranteed safety standards"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM VOLTAGE"},
  //         {"topic": "35kW/l", "description": "PEAK POWER DENSITIES"},
  //         {"topic": "300kW", "description": "PEAK POWER LEVEL"},
  //         {"topic": "25kW/kg", "description": "POWER TO WEIGHT"},
  //       ],
  //     },
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> excavatorTexts = {
  //   "topic": "Excavators",
  //   // "TextAreaSmallWithClip": [
  //   //   "37%",
  //   //   "of energy in Excavators is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       [
  //         "HYPERLINK",
  //         "Case study",
  //         "https://turntide.com/wp-content/uploads/2022/08/Case-Study-Mini-Excavator_v07JCB-1.pdf"
  //       ],
  //     ],
  //     "topic": "Turntide for Construction",
  //     "description":
  //         "Designing and manufacturing construction equipment?  We'll help you electrify your excavators or backhoes and get you to market quickly and easily with a fully scalable electrified powertrain solution.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Motors",
  //     "Battery Packs",
  //     "Inverters",
  //     "DC/DC Convertors",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Power Density Motors",
  //       "subTopic":
  //           "For powertrain traction, generator and cooling fan operations",
  //       "descriptioTexts": [
  //         ["TEXT", "Proven reliability"],
  //         ["TEXT", "Flexible, stackable design"],
  //         ["TEXT", "Excellent power & torque density for small spaces"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Motors.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "800V", "description": "MAXIMUM BATTERY VOLTAGE"},
  //         {"topic": "100-800kW", "description": "7 SIZES AVAILABLE"},
  //         {"topic": "96%", "description": "PEAK EFFICIENCY"}
  //       ],
  //     },
  //     {
  //       "topic": "High Performance Lithium-ion NMB battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "Series system voltage"},
  //         {"topic": "4.97-700kWh", "description": "Capacity"}
  //       ],
  //     },
  //     {
  //       "topic": "Low Voltage Inverters",
  //       "subTopic": "Powering mainstream EV's for over 10 years",
  //       "descriptioTexts": [
  //         ["TEXT", "Supports a wide range of motor types"],
  //         ["TEXT", "Highly configurable operation & communications"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Inverters.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "900A", "description": "PEAK CURRENT"},
  //         {"topic": "48-110V", "description": "OPERATING VOLTAGE"}
  //       ],
  //     },
  //     {
  //       "topic": "DC/DC Convertors",
  //       "subTopic":
  //           "Product range for low voltage electrification applications",
  //       "descriptioTexts": [
  //         ["TEXT", "Low voltage and high voltage options"],
  //         ["TEXT", "Can convert batteries to lower voltages"],
  //         ["TEXT", "Powers vehicle ancillaries such as lights & radios"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-DCDCs.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "12-14V", "description": "OUTPUT VOLTAGE"},
  //         {"topic": "500kW", "description": "POWER OUTPUT"},
  //         {"topic": "48 to 96V", "description": "OPERATING VOLTAGES"}
  //       ],
  //     },
  //   ],
  // };
  // static const Map<String, dynamic> trainTexts = {
  //   "topic": "Trains",
  //   // "TextAreaSmallWithClip": [
  //   //   "50%",
  //   //   "of energy in Trains is used by HVAC and lightning",
  //   // ],
  //   "TextAreaWithClipMain": {
  //     "texts": [
  //       //["TEXT", "Battery Packs"],
  //     ],
  //     "topic": "Turntide for Trains",
  //     "description":
  //         "We provide high-performance electrification components for rail hybrid and pure electric solutions to provide train manufacturers a risk-free path to carbon reduction.",
  //   },
  //   // "TextAreaWithClipEnergySaving": {
  //   //   "texts": [
  //   //     "Improve energy efficiency",
  //   //     "Maintain a comfortable environment",
  //   //     "Automate lighting and HVAC",
  //   //     "Extent equipment life",
  //   //   ],
  //   //   "topic": "Stratergies for Sustainable Operations",
  //   //   "description": "",
  //   // },
  //   "subTopics": [
  //     "Battery Packs",
  //   ],
  //   "subTopicsInside": [
  //     {
  //       "topic": "High Performance Lithium-ion NMC battery",
  //       "subTopic": "With intelligent built-in battery management",
  //       "descriptioTexts": [
  //         ["TEXT", "High energy density"],
  //         ["TEXT", "Flexible & scalable modular design"],
  //         ["TEXT", "For rapid deployment & volume manufacture"],
  //         [
  //           "HYPERLINK",
  //           "Find out more...",
  //           "https://turntide.com/wp-content/uploads/2022/08/All-Vehicle-Batteries.pdf"
  //         ],
  //       ],
  //       "blocks": [
  //         {"topic": "48-630V", "description": "SERIES SYSTEM VOLTAGE"},
  //         {"topic": "4.97-700kWh", "description": "CAPACITY"},
  //         {"topic": "Over 1000V", "description": "RAIL APPLICATIONS"}
  //       ],
  //     },
  //   ],
  // };
}
