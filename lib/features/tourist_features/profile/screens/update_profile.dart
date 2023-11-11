import 'dart:typed_data';
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
import 'package:intl/intl.dart';

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
  String name = 'Kurt Vincent Timajo';

  Map details = {
    'first_name': 'Lambert Jonard',
    'last_name': 'Dela Cruz',
    'sex': 'M',
    'nationality': 'Filipino',
    'birth_date': '1998-08-12',
    'email': 'misteryosow@gmail.com',
    'address': {
      "country": "Philippines",
      "province": "Misamis Oriental",
      "city_municipality": "Cagayan de Oro City"
    }
  };

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
      title: 'Update Profile',
      child: Column(children: [
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
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText.heading(text: 'Basic Information'),
              BTTextFieldWithLabel(
                label: 'First Name',
                placeholder: '${details['first_name']}',
              ),
              BTTextFieldWithLabel(
                label: 'Last Name',
                placeholder: '${details['last_name']}',
              ),
              BTDropdownMenu(
                hint: '${details['sex']}',
                label: 'Sex',
                dropdownValues: const ['Male', 'Female'],
                onChange: () {},
              ),
              BTDropdownMenu(
                hint: '${details['nationality']}',
                label: 'Nationality',
                dropdownValues: const [
                  'Filipino',
                  'American',
                  'Australian',
                  'Chinese',
                  'Japanese',
                  'Korean',
                ],
                onChange: () {},
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
                  Text(DateFormat.yMMMd()
                      .format(DateTime.parse(details['birth_date'])))
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
                placeholder: '${details['address']['country']}',
              ),
              BTTextFieldWithLabel(
                label: 'Province',
                placeholder: '${details['address']['province']}',
              ),
              BTTextFieldWithLabel(
                label: 'City / Municipality',
                placeholder: '${details['address']['city_municipality']}',
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              appText.heading(
                text: 'Account Credentials',
              ),
              const BTTextFieldWithLabel(
                label: 'New Email Address',
                placeholder: 'Enter a valid Email Address',
              ),
              const BTPasswordField(
                  label: 'New Password', placeholder: 'Enter New Password'),
              const BTPasswordField(
                  label: 'Confirm New Password',
                  placeholder: 'Enter New Password'),
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
          label: 'Save Changes',
        ),
        BTRedBtnWithBorder(
          height: 45.0,
          labelText: 'Cancel',
          action: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
