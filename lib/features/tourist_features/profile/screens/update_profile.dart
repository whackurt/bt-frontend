import 'dart:typed_data';
import 'package:bt_frontend/features/tourist_features/providers/tourist_profile.provider.dart';
import 'package:bt_frontend/widgets/custom_dropdown/dropdown_menu.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BTTouristUpdateProfile extends StatefulWidget {
  const BTTouristUpdateProfile({super.key});

  @override
  State<BTTouristUpdateProfile> createState() => _BTTouristUpdateProfileState();
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected');
}

DateTime? birthDate;

Map<String, dynamic> updateData = {};

class _BTTouristUpdateProfileState extends State<BTTouristUpdateProfile> {
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
    var tourist =
        Provider.of<TouristProfileProvider>(context, listen: false).touristData;

    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: 'Update Profile',
      child: Column(children: [
        Stack(
          children: [
            image != null
                ? CircleAvatar(
                    radius: 75,
                    backgroundImage: MemoryImage(image!),
                    backgroundColor: Colors.indigo,
                  )
                : CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage('${tourist['photo_url']}'),
                    backgroundColor: Colors.white,
                  ),
            Positioned(
              bottom: -8,
              left: 90,
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
        // Text(Provider.of<TouristProfileProvider>(context, listen: false)
        //     .touristData
        //     .toString()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText.heading(text: 'Basic Information'),
              BTTextFieldWithLabel(
                label: 'First Name',
                placeholder: '${tourist['first_name']}',
              ),
              BTTextFieldWithLabel(
                label: 'Last Name',
                placeholder: '${tourist['last_name']}',
              ),
              BTDropdownMenu(
                hint: '${tourist['gender']}',
                label: 'Gender',
                dropdownValues: const ['Male', 'Female'],
                onChange: () {},
              ),
              BTTextFieldWithLabel(
                label: 'Nationality',
                placeholder: '${tourist['nationality']}',
              ),
              BTTextFieldWithLabel(
                label: 'Contact Number',
                placeholder: '${tourist['contact_number']}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  appText.heading(text: 'Date of Birth '),
                  Text('${tourist['date_of_birth']}')
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 134, 134, 134)),
                    borderRadius: BorderRadius.circular(3.0)),
                child: DateTimeField(
                  lastDate: DateTime.now(),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white),
                  mode: DateTimeFieldPickerMode.date,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      birthDate = value;
                    });
                  },
                  selectedDate: birthDate,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              appText.heading(text: 'Permanent Address'),
              BTTextFieldWithLabel(
                label: 'Country',
                placeholder: '${tourist['country']}',
              ),
              BTTextFieldWithLabel(
                label: 'Province',
                placeholder: '${tourist['state_province']}',
              ),
              BTTextFieldWithLabel(
                label: 'City / Municipality',
                placeholder: '${tourist['city_municipality']}',
              )
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 20.0),
        //   child: Column(
        //     children: [
        //       appText.heading(
        //         text: 'Account Credentials',
        //       ),
        //       const BTTextFieldWithLabel(
        //         label: 'New Email Address',
        //         placeholder: 'Enter a valid Email Address',
        //       ),
        //       const BTPasswordField(
        //           label: 'New Password', placeholder: 'Enter New Password'),
        //       const BTPasswordField(
        //           label: 'Confirm New Password',
        //           placeholder: 'Enter New Password'),
        //     ],
        //   ),
        // ),
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
                          Navigator.of(context).pop(); // Close the alert dialog
                        },
                        child: const Text(
                          'Cancel',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the alert dialog
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
        const SizedBox(
          height: 40.0,
        ),
      ]),
    );
  }
}
