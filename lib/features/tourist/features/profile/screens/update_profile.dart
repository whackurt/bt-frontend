import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/profile/controllers/tourist_profile.controller.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_profile.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BTTouristUpdateProfile extends StatefulWidget {
  const BTTouristUpdateProfile({super.key});

  @override
  State<BTTouristUpdateProfile> createState() => _BTTouristUpdateProfileState();
}

Map<String, dynamic> touristProvider = {};

final TextEditingController firstController = TextEditingController();
final TextEditingController lastController = TextEditingController();
final TextEditingController nationalityController = TextEditingController();
final TextEditingController countryController = TextEditingController();
final TextEditingController provinceController = TextEditingController();
final TextEditingController citymunicipalityController =
    TextEditingController();
final TextEditingController contactController = TextEditingController();
final TextEditingController address1Controller = TextEditingController();
final TextEditingController address2Controller = TextEditingController();

class _BTTouristUpdateProfileState extends State<BTTouristUpdateProfile> {
  AppText appText = AppText();
  TouristProfileController touristProfileController =
      TouristProfileController();

  String? gender;
  String newGender = '';
  bool genderError = false;
  bool loading = false;
  bool uploadingImage = false;

  Map touristData = {};
  Map updateData = {};
  DateTime? birthDate;

  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  Future updateDataNotEmpty() async {
    firstController.text.isNotEmpty
        ? updateData['first_name'] = firstController.text.toString()
        : null;

    lastController.text.isNotEmpty
        ? updateData['last_name'] = lastController.text.toString()
        : null;

    newGender != '' ? updateData['gender'] = newGender : null;

    nationalityController.text.isNotEmpty
        ? updateData['nationality'] = nationalityController.text.toString()
        : null;

    contactController.text.isNotEmpty
        ? updateData['contact_number'] = contactController.text.toString()
        : null;

    countryController.text.isNotEmpty
        ? updateData['country'] = countryController.text.toString()
        : null;

    provinceController.text.isNotEmpty
        ? updateData['state_province'] = provinceController.text.toString()
        : null;

    citymunicipalityController.text.isNotEmpty
        ? updateData['city_municipality'] =
            citymunicipalityController.text.toString()
        : null;

    address1Controller.text.isNotEmpty
        ? updateData['address_1'] = address1Controller.text.toString()
        : null;

    address2Controller.text.isNotEmpty
        ? updateData['address_2'] = address2Controller.text.toString()
        : null;

    birthDate != null
        ? updateData['date_of_birth'] = birthDate.toString()
        : null;

    if (updateData.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future getTouristData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await touristProfileController
        .getTouristProfileData(id: pref.getInt('touristId').toString())
        .then((res) {
      if (res['success']) {
        setState(() {
          touristData = res['data']['data'];
        });
        context
            .read<TouristProfileProvider>()
            .setTouristData(data: touristData);
      }
    });
  }

  Future saveUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await touristProfileController
        .updateTouristProfile(
            id: pref.getInt('touristId').toString(), updateData: updateData)
        .then((res) {
      if (res['success']) {
        getTouristData();

        firstController.clear();
        lastController.clear();
        nationalityController.clear();
        contactController.clear();
        countryController.clear();
        provinceController.clear();
        citymunicipalityController.clear();
        address1Controller.clear();
        address2Controller.clear();

        BotToast.showText(text: 'Profile updated successfully.');
      } else {
        BotToast.showText(text: 'Failed to update profile.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getTouristData();
  }

  @override
  Widget build(BuildContext context) {
    gender = touristData['gender'];

    var touristProvider =
        Provider.of<TouristProfileProvider>(context, listen: true);

    return BTContentWrapper(
      onRefresh: () async {
        getTouristData();
      },
      title: 'Update Profile',
      child: Column(children: [
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.penToSquare,
              size: 38.0,
              color: Colors.red[400],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText().purpleBoldHeader(text: 'Update Your Profile'),
                  AppText().subHeader(
                    context: context,
                    text: 'Personalize Your Information',
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Stack(
          children: [
            _imageFile != null
                ? ClipOval(
                    child: Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  )
                : CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        '${touristProvider.touristData['photo_url'] ?? 'https://static-00.iconduck.com/assets.00/profile-major-icon-2048x2048-z1oddwyo.png'}'),
                    backgroundColor: Colors.white,
                  ),
            Positioned(
              bottom: -8,
              left: 90,
              child: IconButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
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
            children: [
              appText.heading(text: 'Basic Information'),
              BTTextFieldWithLabel(
                label: 'First Name',
                placeholder: '${touristProvider.touristData['first_name']}',
                controller: firstController,
              ),
              BTTextFieldWithLabel(
                label: 'Last Name',
                placeholder: '${touristProvider.touristData['last_name']}',
                controller: lastController,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Gender',
                      style: TextStyle(fontSize: 11.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(PropValues().borderRadius),
                    color: PropValues().secondary,
                  ),
                  child: Center(
                    child: DropdownButtonFormField<String>(
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
                      value: touristProvider.touristData['gender'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // underline: Container(),
                      validator: (value) {
                        if (value == null) {
                          setState(() {
                            genderError = true;
                          });
                          return null;
                        } else {
                          return null;
                        }
                      },
                      isExpanded: true,
                      hint: const Text('Gender'),
                      onChanged: (newValue) {
                        setState(() {
                          newGender = newValue ?? '';
                          genderError = false;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: [
                        'Male',
                        'Female',
                      ].map<DropdownMenuItem<String>>((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30.0,
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ),
              BTTextFieldWithLabel(
                label: 'Nationality',
                placeholder: '${touristProvider.touristData['nationality']}',
                controller: nationalityController,
              ),
              BTTextFieldWithLabel(
                label: 'Contact Number',
                placeholder: '${touristProvider.touristData['contact_number']}',
                controller: contactController,
              ),
            ],
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Date of Birth',
                style: TextStyle(fontSize: 11.0, color: Colors.indigo),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          height: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(PropValues().borderRadius),
            color: PropValues().secondary,
          ),
          child: Center(
            child: DateTimeField(
              initialDate: DateTime.tryParse(
                  '${touristProvider.touristData['date_of_birth']} 00:00:00.000'
                      .toString()),
              lastDate: DateTime.now(),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.transparent),
              mode: DateTimeFieldPickerMode.date,
              onDateSelected: (DateTime value) {
                setState(() {
                  birthDate = value;
                });
              },
              selectedDate: birthDate ??
                  DateTime.tryParse(
                      '${touristProvider.touristData['date_of_birth']} 00:00:00.000'
                          .toString()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              appText.heading(text: 'Permanent Address'),
              BTTextFieldWithLabel(
                label: 'Country',
                placeholder: '${touristProvider.touristData['country']}',
                controller: countryController,
              ),
              BTTextFieldWithLabel(
                label: 'Province',
                placeholder: '${touristProvider.touristData['state_province']}',
                controller: provinceController,
              ),
              BTTextFieldWithLabel(
                label: 'City / Municipality',
                placeholder:
                    '${touristProvider.touristData['city_municipality']}',
                controller: citymunicipalityController,
              ),
              BTTextFieldWithLabel(
                label: 'Address 1',
                placeholder: '${touristProvider.touristData['address_1']}',
                controller: address1Controller,
              ),
              BTTextFieldWithLabel(
                label: 'Address 2',
                placeholder:
                    '${touristProvider.touristData['address_2'] ?? ''}',
                controller: address2Controller,
              ),
            ],
          ),
        ),
        BTFullWidthButton(
          height: 50.0,
          onPressed: () async {
            if (_imageFile != null) {
              setState(() {
                uploadingImage = true;
                loading = true;
              });

              var imgUrl = await touristProfileController.updateProfilePicture(
                  imageFile: _imageFile);

              setState(() {
                uploadingImage = false;
                loading = false;
              });

              updateData['photo_url'] = imgUrl;
            }

            var notEmpty = await updateDataNotEmpty();

            if (notEmpty) {
              setState(() {
                loading = true;
              });

              await saveUpdate();

              updateData.clear();

              setState(() {
                loading = false;
              });
            }
          },
          child: loading
              ? const SpinKitRing(
                  color: Colors.white,
                  lineWidth: 3.0,
                  size: 25.0,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.floppyDisk,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      uploadingImage ? 'Uploading image...' : 'Save Changes',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
        ),
        BTRedBtnWithBorder(
          height: 45.0,
          icon: FontAwesomeIcons.circleXmark,
          labelText: 'Cancel',
          action: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 10.0,
        )
      ]),
    );
  }
}
