import 'package:bt_frontend/features/auth_features/providers/tourist_auth.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TouristCreateAccount extends StatefulWidget {
  const TouristCreateAccount({super.key});

  @override
  State<TouristCreateAccount> createState() => _TouristCreateAccountState();
}

final TextEditingController firstController = TextEditingController();
final TextEditingController lastController = TextEditingController();
final TextEditingController nationalityController = TextEditingController();
final TextEditingController countryController = TextEditingController();
final TextEditingController provinceController = TextEditingController();
final TextEditingController citymunicipalityController =
    TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController contactController = TextEditingController();
final TextEditingController address1Controller = TextEditingController();
final TextEditingController address2Controller = TextEditingController();

String? gender;
DateTime? birthDate;

class _TouristCreateAccountState extends State<TouristCreateAccount> {
  AppText apptext = AppText();
  final _createAccountKey = GlobalKey<FormState>();

  bool genderError = false;
  bool birthDateError = false;

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: '',
      child: Column(
        children: [
          Form(
            key: _createAccountKey,
            child: Column(
              children: [
                apptext.titleWithInstruction(
                    context: context,
                    title: 'Create an Account',
                    instruction:
                        'Please enter all necessary information requested below.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      apptext.heading(
                        text: 'Basic Information',
                      ),
                      BTTextField(
                        placeholder: 'First Name',
                        controller: firstController,
                        validator: (value) =>
                            value!.isEmpty ? 'First Name is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'Last Name',
                        controller: lastController,
                        validator: (value) =>
                            value!.isEmpty ? 'Last Name is required.' : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          // height: 50.0,
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white,
                              border: Border.all(
                                  color: genderError
                                      ? const Color.fromARGB(255, 219, 41, 38)
                                      : const Color.fromARGB(255, 43, 42, 42))),
                          child: DropdownButtonFormField<String>(
                            value: gender,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                gender = newValue;
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
                      genderError
                          ? Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      11.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    genderError ? 'Gender is required.' : '',
                                    style: TextStyle(
                                        color: Colors.red[600], fontSize: 12.0),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      BTTextField(
                        placeholder: 'Nationality',
                        controller: nationalityController,
                        validator: (value) =>
                            value!.isEmpty ? 'Nationality is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'Contact Number',
                        controller: contactController,
                        validator: (value) => value!.isEmpty
                            ? 'Contact number is required.'
                            : null,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      apptext.heading(text: 'Date of Birth'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white,
                              border: Border.all(
                                  color: birthDateError
                                      ? const Color.fromARGB(255, 219, 41, 38)
                                      : const Color.fromARGB(255, 43, 42, 42))),
                          child: DateTimeField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white),
                            mode: DateTimeFieldPickerMode.date,
                            lastDate: DateTime.now(),
                            onDateSelected: (DateTime value) {
                              setState(() {
                                birthDate = value;
                                birthDateError = false;
                              });
                            },
                            selectedDate: birthDate,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(11.0, 0.0, 0.0, 5.0),
                            child: Text(
                              birthDateError
                                  ? 'Date of Birth is required.'
                                  : '',
                              style: TextStyle(
                                  color: Colors.red[600], fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      apptext.heading(text: 'Permanent Address'),
                      BTTextField(
                        placeholder: 'Country',
                        controller: countryController,
                        validator: (value) =>
                            value!.isEmpty ? 'Country is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'State/Province',
                        controller: provinceController,
                        validator: (value) =>
                            value!.isEmpty ? 'Province is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'City / Municipality',
                        controller: citymunicipalityController,
                        validator: (value) => value!.isEmpty
                            ? 'City/Municipality is required.'
                            : null,
                      ),
                      BTTextField(
                        placeholder:
                            'Address 1 (Brgy., Village, District, etc.)',
                        controller: address1Controller,
                        validator: (value) =>
                            value!.isEmpty ? 'Address 1 is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'Address 2 (optional: Street, Zone, etc.)',
                        controller: address2Controller,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      apptext.heading(text: 'Account Details'),
                      BTTextFieldWithLabel(
                          label: 'Email Address',
                          placeholder: 'john@example.com',
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) return 'Email is required.';
                            final emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          }),
                      BTPasswordField(
                        label: 'Password',
                        placeholder: '••••••••••',
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required.';
                          }
                          if (value.isNotEmpty && value.length < 8) {
                            return 'Password must be at least 8 characters.';
                          }
                          return null;
                        },
                      ),
                      BTPasswordField(
                        label: 'Confirm Password',
                        placeholder: '••••••••••',
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is required.';
                          }
                          if (value != passwordController.text.trim()) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BTFullWidthButton(
            onPressed: () {
              setState(() {
                genderError = false;
                birthDateError = false;
              });

              if (birthDate == null) {
                setState(() {
                  birthDateError = true;
                });
              }

              if (_createAccountKey.currentState!.validate() &&
                  !birthDateError &&
                  !genderError) {
                context.read<TouristAuthProvider>().updateData(touristInfo: {
                  'first_name': firstController.text,
                  'last_name': lastController.text,
                  'gender': gender,
                  'nationality': nationalityController.text,
                  'contact_number': contactController.text,
                  'date_of_birth': birthDate,
                  'address': {
                    'country': countryController.text,
                    'state_province': provinceController.text,
                    'city_municipality': citymunicipalityController.text,
                    'address_1': address1Controller.text,
                    'address_2': address2Controller.text,
                  },
                  'auth': {
                    'email': emailController.text,
                    'password': passwordController.text
                  }
                });
                Navigator.pushNamed(context, '/signup/tourist/uploadPic');
              }

              // Navigator.pushNamed(context, '/signup/tourist/uploadPic');
            },
            height: 50.0,
            child: const Text(
              'Proceed',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
