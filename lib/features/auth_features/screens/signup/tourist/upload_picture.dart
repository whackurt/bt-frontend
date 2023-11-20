// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:bt_frontend/features/auth_features/providers/tourist_auth.provider.dart';

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
  return null;
}

Uint8List? image;
bool photoError = false;

class _TouristUploadPictureState extends State<TouristUploadPicture> {
  AppText appText = AppText();

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);

    if (img != null) {
      setState(() {
        image = img;
        photoError = false;
      });
    } else {
      setState(() {
        photoError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      title: '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appText.titleWithInstruction(
              context: context,
              title: 'Upload Picture',
              instruction: 'Attach a clear photo of your face.'),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .20,
              ),
              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 90,
                          backgroundImage: MemoryImage(image!),
                          backgroundColor: Colors.grey,
                        )
                      : const CircleAvatar(
                          radius: 90,
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
              const SizedBox(
                height: 8.0,
              ),
              photoError
                  ? Text(
                      'Photo is required.',
                      style: TextStyle(color: Colors.red[600], fontSize: 15.0),
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
          ),
          Column(
            children: [
              const Text(
                'By clicking "Verify", you hereby authorize Bantay Turista-Camiguin PPO to collect and process the above information.',
                maxLines: 4,
              ),
              BTFullWidthButton(
                onPressed: () {
                  setState(() {
                    photoError = false;
                  });
                  if (image == null) {
                    setState(() {
                      photoError = true;
                    });
                  } else {
                    context
                        .read<TouristAuthProvider>()
                        .updatePicture(image: image);
                    Navigator.pushNamed(context, '/signup/tourist/verify');
                  }
                },
                height: 50.0,
                child: const Text(
                  'Verify',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
