// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Future<void> requestCameraPermission() async {
    final cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    } else {
      Navigator.pushNamed(
        context,
        '/take_picture',
      );
    }
  }

  Future<void> requestLocationPermission() async {
    final locationStatus = await Permission.location.status;
    if (locationStatus.isDenied) {
      await Permission.location.request();
    } else {
      MotionToast.success(description: const Text('permission already granted'))
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                requestCameraPermission();
              },
              label: const Text('permission for camera'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.location_on),
              onPressed: () {
                requestLocationPermission();
              },
              label: const Text('Permission for location'),
            ),
          ),
        ]),
      ),
    );
  }
}
