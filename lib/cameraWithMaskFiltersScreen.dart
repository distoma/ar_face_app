import 'package:flutter/material.dart';

class CameraWithMaskFiltersScreen extends StatefulWidget {
  const CameraWithMaskFiltersScreen({Key? key}) : super(key: key);

  @override
  State<CameraWithMaskFiltersScreen> createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "camera with mask filters",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
