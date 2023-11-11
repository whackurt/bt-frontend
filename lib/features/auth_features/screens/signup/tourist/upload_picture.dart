// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TouristUploadPicture extends StatefulWidget {
  const TouristUploadPicture({super.key});

  @override
  State<TouristUploadPicture> createState() => _TouristUploadPictureState();
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected');
}

class _TouristUploadPictureState extends State<TouristUploadPicture> {
  AppText appText = AppText();

  Uint8List? image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            appText.titleWithInstruction(
                context: context,
                title: 'Upload Picture',
                instruction: 'Attach a clear photo of your face.'),
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 85,
                        backgroundImage: MemoryImage(image!),
                        backgroundColor: Colors.indigo,
                      )
                    : CircleAvatar(
                        radius: 85,
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/6915/6915987.png'),
                        backgroundColor: Colors.white,
                      ),
                Positioned(
                  bottom: -8,
                  left: 110,
                  child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 33.0,
                        color: Colors.grey[800],
                      )),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                    'By clicking "Verify", you hereby authorize Bantay Turista-Camiguin PPO to collect and process the above information.'),
                BTFullWidthButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup/tourist/verify');
                  },
                  label: 'Verify',
                  height: 50.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
