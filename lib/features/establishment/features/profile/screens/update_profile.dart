import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bt_frontend/features/auth/services/est_auth.services.dart';
import 'package:bt_frontend/features/establishment/features/profile/controllers/establishment_profile.controller.dart';
import 'package:bt_frontend/features/establishment/providers/est_profile.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  EstablishmentProfileController estProfileController =
      EstablishmentProfileController();
  EstablishmentAuthServices establishmentAuthServices =
      EstablishmentAuthServices();

  TextEditingController nameController = TextEditingController();
  TextEditingController cityMunicipalityController = TextEditingController();
  TextEditingController brgyController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController oNameController = TextEditingController();
  TextEditingController oEmailController = TextEditingController();
  TextEditingController oPhoneController = TextEditingController();

  bool loading = false;
  Map userProfile = {};
  List estTypes = [];

  File? _imageFile;
  Map updateData = {};
  String? estType;
  bool estTypeError = false;
  bool uploadingImage = false;

  Future getEstablishmentProfileData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    await estProfileController
        .getEstProfileData(id: pref.getInt('establishmentId').toString())
        .then((res) {
      setState(() {
        userProfile = res['data']['data'];
        loading = false;
      });
      context
          .read<EstablishmentProfileProvider>()
          .setProfileData(data: userProfile);
    });
  }

  Future getEstablishmentTypes() async {
    var res = await establishmentAuthServices.getEstTypes();
    estTypes = res['data']['data'];
  }

  Future saveUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await estProfileController
        .updateEstProfile(
            id: pref.getInt('establishmentId').toString(),
            updateData: updateData)
        .then((res) {
      if (res['success']) {
        getEstablishmentProfileData();

        nameController.clear();
        cityMunicipalityController.clear();
        brgyController.clear();
        address1Controller.clear();
        oNameController.clear();
        oEmailController.clear();
        oPhoneController.clear();

        AnimatedSnackBar.rectangle(
          'Success',
          'Profile updated successfully.',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
        ).show(
          context,
        );
      }
    });
  }

  Future updateDataNotEmpty() async {
    nameController.text.isNotEmpty
        ? updateData['name'] = nameController.text.toString()
        : null;

    estType != null ? updateData['type_id'] = estType!.split(',').first : null;

    cityMunicipalityController.text.isNotEmpty
        ? updateData['city_municipality'] =
            cityMunicipalityController.text.toString()
        : null;

    brgyController.text.isNotEmpty
        ? updateData['barangay'] = brgyController.text.toString()
        : null;

    address1Controller.text.isNotEmpty
        ? updateData['address_1'] = address1Controller.text.toString()
        : null;

    oNameController.text.isNotEmpty
        ? updateData['owner_name'] = oNameController.text.toString()
        : null;

    oEmailController.text.isNotEmpty
        ? updateData['owner_email'] = oEmailController.text.toString()
        : null;

    oPhoneController.text.isNotEmpty
        ? updateData['owner_phone'] = oPhoneController.text.toString()
        : null;

    if (updateData.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) _imageFile = File(pickedFile.path);
    });
  }

  @override
  void initState() {
    super.initState();
    getEstablishmentProfileData();
    getEstablishmentTypes();
  }

  @override
  Widget build(BuildContext context) {
    var estProvider =
        Provider.of<EstablishmentProfileProvider>(context, listen: true);

    return BTContentWrapper(
      onRefresh: () async {
        getEstablishmentProfileData();
      },
      title: 'Update Profile',
      child: Column(
        children: [
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
                          '${estProvider.profileData['photo_url'] ?? 'https://static-00.iconduck.com/assets.00/profile-major-icon-2048x2048-z1oddwyo.png'}'),
                      backgroundColor: Colors.white,
                    ),
              Positioned(
                bottom: -8,
                left: 80,
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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                BTTextFieldWithLabel(
                  label: 'Establishment Name',
                  placeholder: '${estProvider.profileData['name']}',
                  controller: nameController,
                ),
                const Row(
                  children: [Text('Establishment Type')],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: Container(
                    // height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                        border: Border.all(
                            color: estTypeError
                                ? const Color.fromARGB(255, 219, 41, 38)
                                : const Color.fromARGB(255, 43, 42, 42))),
                    child: DropdownButtonFormField<String>(
                      value: estType,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // underline: Container(),
                      validator: (value) {
                        if (value == null) {
                          setState(() {
                            estTypeError = true;
                          });
                          return;
                        } else {
                          return null;
                        }
                      },
                      isExpanded: true,
                      hint: Text('${estTypes.firstWhere(
                        (type) =>
                            estProvider.profileData['type_id'] == type['id'],
                        orElse: () => {'value': 'Item not found'},
                      )['name']}'),
                      onChanged: (newValue) {
                        setState(() {
                          estType = newValue;
                          estTypeError = false;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 0.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: estTypes.map<DropdownMenuItem<String>>((type) {
                        return DropdownMenuItem<String>(
                          value:
                              '${type['id'].toString()},${type['name'].toString()}',
                          child: Text(type['name']),
                        );
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 30.0,
                      dropdownColor: Colors.white,
                    ),
                  ),
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
                  label: 'City/Municipality',
                  placeholder:
                      '${estProvider.profileData['city_municipality']}',
                  controller: cityMunicipalityController,
                ),
                BTTextFieldWithLabel(
                  label: 'Barangay',
                  placeholder: '${estProvider.profileData['barangay']}',
                  controller: brgyController,
                ),
                BTTextFieldWithLabel(
                  label: 'Address 1',
                  placeholder: '${estProvider.profileData['address_1'] ?? ''}',
                  controller: address1Controller,
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
                  placeholder: '${estProvider.profileData['owner_name']}',
                  controller: oNameController,
                ),
                BTTextFieldWithLabel(
                  label: 'Email Address',
                  placeholder: '${estProvider.profileData['owner_email']}',
                  controller: oEmailController,
                ),
                BTTextFieldWithLabel(
                  label: 'Phone Number',
                  placeholder: '${estProvider.profileData['owner_phone']}',
                  controller: oPhoneController,
                ),
              ],
            ),
          ),
          BTFullWidthButton(
            onPressed: () async {
              if (_imageFile != null) {
                setState(() {
                  uploadingImage = true;
                  loading = true;
                });

                var imgUrl = await estProfileController.updateEstPicture(
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
            height: 50.0,
            child: loading
                ? const SpinKitRing(
                    color: Colors.white,
                    lineWidth: 3.0,
                    size: 25.0,
                  )
                : Text(
                    uploadingImage ? 'Uploading image...' : 'Save Changes',
                    style: const TextStyle(
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
          )
        ],
      ),
    );
  }
}
