// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:bt_frontend/features/auth/providers/tourist_auth.provider.dart';

class TouristUploadPicture extends StatefulWidget {
  const TouristUploadPicture({super.key});

  @override
  State<TouristUploadPicture> createState() => _TouristUploadPictureState();
}

bool photoError = false;

class _TouristUploadPictureState extends State<TouristUploadPicture> {
  AppText appText = AppText();

  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
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
                height: MediaQuery.of(context).size.height * .15,
              ),
              Stack(
                children: [
                  _imageFile != null
                      ? ClipOval(
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                            width: 170,
                            height: 170,
                          ),
                        )
                      : ClipOval(
                          child: Image.network(
                            'https://cdn.icon-icons.com/icons2/3065/PNG/512/profile_user_account_icon_190938.png',
                            fit: BoxFit.cover,
                            width: 170,
                            height: 170,
                          ),
                        ),
                  Positioned(
                    bottom: -6,
                    left: 105,
                    child: IconButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 33.0,
                          color: Color.fromARGB(255, 156, 157, 163),
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
                style: TextStyle(fontSize: 12.0),
                maxLines: 4,
              ),
              const SizedBox(
                height: 10.0,
              ),
              BTFullWidthButton(
                onPressed: () {
                  setState(() {
                    photoError = false;
                  });
                  if (_imageFile == null) {
                    setState(() {
                      photoError = true;
                    });
                  } else {
                    context
                        .read<TouristAuthProvider>()
                        .updatePicture(image: _imageFile);
                    Navigator.pushNamed(context, '/signup/tourist/verify');
                  }
                },
                height: 50.0,
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
