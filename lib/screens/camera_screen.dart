import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  const TakeImage({Key? key}) : super(key: key);

  @override
  State<TakeImage> createState() => Take_ImageState();
}

class Take_ImageState extends State<TakeImage> {
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Implementing the camera
  Future<void> _openCamera() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Camera and Image Picker'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.image),
                  onPressed: _openImagePicker,
                  label: const Text('Select An Image'),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.camera),
                  onPressed: _openCamera,
                  label: const Text('Capture using Camera'),
                ),
              ),
            ]),
          ),
        ));
  }
}
