import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';

enum Masks {
  none,
  aviators,
  bigmouth,
  dalmatian,
  bcgSeg,
  look2,
  fatify,
  flowers,
  grumpycat,
  koala,
  lion,
  mudMask,
  obama,
  pug,
  slash,
  sleepingmask,
  smallface,
  teddycigar,
  tripleface,
  twistedFace,
}

enum Effects {
  none,
  fire,
  heart,
  blizzard,
  rain,
}

enum Filters {
  none,
  tv80,
  drawingmanga,
  sepia,
  bleachbypass,
  realvhs,
  filmcolorperfection,
}


class CameraWithMaskFiltersScreen extends StatefulWidget {
  const CameraWithMaskFiltersScreen({Key? key}) : super(key: key);

  @override
  State<CameraWithMaskFiltersScreen> createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  late CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // deep AR Camera
          ],
        ),
      ),
    );
  }
}
