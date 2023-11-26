// ignore_for_file: prefer_const_constructors
import 'package:bt_frontend/features/auth/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth/providers/establishment_auth.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:bt_frontend/features/auth/controllers/est_type.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstablishmentCreateAccount extends StatefulWidget {
  const EstablishmentCreateAccount({super.key});

  @override
  State<EstablishmentCreateAccount> createState() =>
      _EstablishmentCreateAccountState();
}

class _EstablishmentCreateAccountState
    extends State<EstablishmentCreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController cityMunicipalityController = TextEditingController();
  TextEditingController brgyController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController oNameController = TextEditingController();
  TextEditingController oEmailController = TextEditingController();
  TextEditingController oContactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AppText apptext = AppText();

  final _registerKey = GlobalKey<FormState>();
  final AuthController authController = AuthController();
  final EstablishmentTypeController esttypeController =
      EstablishmentTypeController();

  List estTypes = [];
  bool estTypeError = false;
  String? estType;

  @override
  void initState() {
    super.initState();
    getEstTypes();
  }

  Future getEstTypes() async {
    await esttypeController.getEstTypes().then((res) {
      if (res['success']) {
        setState(() {
          estTypes = res['data']['data'];
        });
        context
            .read<EstablishmentAuthProvider>()
            .setEstablishmentType(establishmentTypes: res['data']['data']);
      }
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
        children: [
          Form(
            key: _registerKey,
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
                        placeholder: 'Establishment Name',
                        controller: nameController,
                        validator: (value) => value!.isEmpty
                            ? 'Establishment Name is required.'
                            : null,
                      ),
                      BTTextField(
                        placeholder: 'Contact Number',
                        controller: contactController,
                        validator: (value) => value!.isEmpty
                            ? 'Contact Number is required.'
                            : null,
                      ),
                      // Text('$estType'),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            hint: const Text('Type of Establishment'),
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
                            items: context
                                .watch<EstablishmentAuthProvider>()
                                .establishmentTypes
                                .map<DropdownMenuItem<String>>((type) {
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
                estTypeError
                    ? Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              estTypeError
                                  ? 'Establishment type is required.'
                                  : '',
                              style: TextStyle(
                                  color: Colors.red[600], fontSize: 12.0),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      apptext.heading(text: 'Location'),
                      BTTextField(
                        placeholder: 'City / Municipality',
                        controller: cityMunicipalityController,
                        validator: (value) => value!.isEmpty
                            ? 'City/Municipality is required.'
                            : null,
                      ),
                      BTTextField(
                        placeholder: 'Barangay',
                        controller: brgyController,
                        validator: (value) =>
                            value!.isEmpty ? 'Barangay is required.' : null,
                      ),
                      BTTextField(
                        placeholder: 'Address 1 (optional: Street, Zone, etc.)',
                        controller: address1Controller,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      apptext.heading(
                        text: 'Owner\'s Information',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                          'Business Owner, Manager or Local Chief Executive/Authorized Representative'),
                      SizedBox(
                        height: 8.0,
                      ),
                      BTTextField(
                        placeholder: 'Owner\'s Name',
                        controller: oNameController,
                        validator: (value) => value!.isEmpty
                            ? 'Owner\'s Name is required.'
                            : null,
                      ),
                      BTTextField(
                          placeholder: 'Owner\'s Email Address',
                          controller: oEmailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email address is required.';
                            }
                            final emailRegex =
                                RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          }),
                      BTTextField(
                        placeholder: 'Owner\'s Contact Number',
                        controller: oContactController,
                        validator: (value) => value!.isEmpty
                            ? 'Owner\'s Contact Number is required.'
                            : null,
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
                            if (value!.isEmpty) {
                              return 'Email address is required.';
                            }
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
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters.';
                            }
                            return null;
                          }),
                      BTPasswordField(
                        label: 'Confirm Password',
                        placeholder: '••••••••••',
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password.';
                          }

                          if (value != passwordController.text) {
                            return 'Passwords do not match.';
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
              if (_registerKey.currentState!.validate()) {
                context
                    .read<EstablishmentAuthProvider>()
                    .updateData(establishmentInfo: {
                  "name": nameController.text,
                  "contact_number": contactController.text,
                  "city_municipality": cityMunicipalityController.text,
                  "barangay": brgyController.text,
                  "address_1": address1Controller.text,
                  "owner_name": oNameController.text,
                  "owner_email": oEmailController.text,
                  "owner_phone": oContactController.text,
                  "email": emailController.text,
                  "password": passwordController.text,
                  "type_id": estType!.split(',').first,
                  "type_name": estType!.split(',').last
                });

                Navigator.pushNamed(context, '/signup/establishment/uploadPic');
              }
            },
            height: 50.0,
            child: Text(
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
