import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:avatar_view/avatar_view.dart';
import 'dart:io' show Platform;

// enum Masks {
//   none,
//   aviators,
//   bigmouth,
//   dalmatian,
//   bcgSeg,
//   look2,
//   fatify,
//   flowers,
//   grumpycat,
//   koala,
//   lion,
//   mudMask,
//   obama,
//   pug,
//   slash,
//   sleepingmask,
//   smallface,
//   teddycigar,
//   tripleface,
//   twistedFace,
// }
//
// enum Effects {
//   none,
//   fire,
//   heart,
//   blizzard,
//   rain,
// }
//
// enum Filters {
//   none,
//   tv80,
//   drawingmanga,
//   sepia,
//   bleachbypass,
//   realvhs,
//   filmcolorperfection,
// }

class CameraWithMaskFiltersScreen extends StatefulWidget {
  const CameraWithMaskFiltersScreen({Key? key}) : super(key: key);

  @override
  State<CameraWithMaskFiltersScreen> createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  late CameraDeepArControllerX cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.empty;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // deep AR Camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {});
              },
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c as CameraDeepArControllerX;
                setState(() {});
              },
              androidLicenceKey: '',
              iosLicenceKey: '',
              onImageCaptured: (String path) {},
              onVideoRecorded: (String path) {},
            ),

            //face mask filters - Icons Buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page) {
                          bool active = currentPage == page;
                          return Platform.isIOS
                              //ios app view
                              ? GestureDetector(
                                  onTap: () {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                    radius: active ? 65 : 30,
                                    borderColor: Colors.yellow,
                                    borderWidth: 2,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath:
                                        "assets/ios/${page.toString()}.jpg",
                                    placeHolder: const Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    errorWidget: Container(
                                      child: const Icon(
                                        Icons.error,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                )
                              //android app view
                              : GestureDetector(
                                  onTap: () {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                    radius: active ? 45 : 25,
                                    borderColor: Colors.yellow,
                                    borderWidth: 2,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath:
                                        "assets/android/${page.toString()}.jpg",
                                    placeHolder: const Icon(
                                      Icons.person,
                                      size: 50,
                                    ),
                                    errorWidget: Container(
                                      child: const Icon(
                                        Icons.error,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
