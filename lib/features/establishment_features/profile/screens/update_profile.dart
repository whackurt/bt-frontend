import 'dart:typed_data';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_dropdown/dropdown_menu.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BTEstablishmentUpdateProfile extends StatefulWidget {
  const BTEstablishmentUpdateProfile({super.key});

  @override
  State<BTEstablishmentUpdateProfile> createState() =>
      _BTEstablishmentUpdateProfileState();
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected');
}

class _BTEstablishmentUpdateProfileState
    extends State<BTEstablishmentUpdateProfile> {
  AppText appText = AppText();

  Map details = {
    'name': 'Jonard\'s grill',
    'type': 'Restaurant',
    'est_contact': '09123456789',
    'est_email': 'misteryosow@gmail.com',
    'est_address': {"brgy": "Baylao", "municipality": "Mambajao"},
    "owner_details": {
      'name': 'Joanrd Lambert Ghini',
      'email': 'themoretheyknow@ustp.edu.ph',
      'phone': '09956299588'
    }
  };

  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];
  String selectedValue = 'Option 1';

  void onChanged(String newValue) {
    selectedValue = newValue;
  }

  List<Map<String, String>> est_types = [
    {
      "id": "1",
      "name": "Cafe",
    },
    {
      "id": "2",
      "name": "Pharmacy",
    },
    {
      "id": "3",
      "name": "Convenience Store",
    }
  ];

  Uint8List? image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: 'Update Profile',
      child: Column(
        children: [
          Stack(
            children: [
              image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(image!),
                      backgroundColor: Colors.indigo,
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'),
                      backgroundColor: Colors.white,
                    ),
              Positioned(
                bottom: -8,
                left: 80,
                child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 30.0,
                      color: Colors.grey[800],
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                BTTextFieldWithLabel(
                  label: 'Establishment Name',
                  placeholder: '${details['name']}',
                ),
                BTDropdownMenu(
                  hint: '${details['type']}',
                  label: 'Establishment Type',
                  dropdownValues: items,
                  onChange: () {},
                ),
                BTTextFieldWithLabel(
                  label: 'Email Address',
                  placeholder: '${details['est_email']}',
                ),
                BTTextFieldWithLabel(
                  label: 'Contact Number',
                  placeholder: '${details['est_contact']}',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                appText.heading(text: 'Location'),
                BTTextFieldWithLabel(
                  label: 'Barangay',
                  placeholder: '${details['est_address']['brgy']}',
                ),
                BTTextFieldWithLabel(
                  label: 'Municipality',
                  placeholder: '${details['est_address']['municipality']}',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                appText.heading(text: 'Owner\'s Information'),
                BTTextFieldWithLabel(
                  label: 'Name',
                  placeholder: '${details['owner_details']['name']}',
                ),
                BTTextFieldWithLabel(
                  label: 'Email Address',
                  placeholder: '${details['owner_details']['email']}',
                ),
                BTTextFieldWithLabel(
                  label: 'Phone Number',
                  placeholder: '${details['owner_details']['phone']}',
                ),
              ],
            ),
          ),
          BTFullWidthButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text(
                        'Confirm Update',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      content:
                          const Text('Are you sure you want to save changes?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the alert dialog
                          },
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the alert dialog
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.green[700]),
                          ),
                        ),
                      ],
                    );
                  }));
            },
            height: 50.0,
            child: Text(
              'Save Changes',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
          BTRedBtnWithBorder(
            height: 45.0,
            labelText: 'Cancel',
            action: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
