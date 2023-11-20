// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bt_frontend/features/auth_features/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth_features/models/tourist.model.dart';
import 'package:bt_frontend/features/auth_features/models/user.model.dart';
import 'package:bt_frontend/features/auth_features/screens/providers/tourist_auth.provider.dart';
import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TouristVerifyDetails extends StatefulWidget {
  const TouristVerifyDetails({super.key});

  @override
  State<TouristVerifyDetails> createState() => _TouristVerifyDetailsState();
}

bool loading = false;
bool error = false;

class _TouristVerifyDetailsState extends State<TouristVerifyDetails> {
  AppText appText = AppText();

  Future loginTourist(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await AuthController().login(user).then((res) {
      if (res['success']) {
        pref.setString('token', res['data']['token']);
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => const TouristContainer()),
            (route) => false);
      } else {
        AnimatedSnackBar.material(
          'Login failed.',
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top,
          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
        ).show(context);
      }
    });
  }

  Future registerTourist(Tourist tourist) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await AuthController().registerTourist(tourist).then((res) {
      if (res['success']) {
        pref.setInt('userId', res['data']['id']['user_id']);
        pref.setInt('touristId', res['data']['id']['tourist_id']);
      } else {
        AnimatedSnackBar.material(
          '${res['data']['message']}: The email has already been taken.',
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top,
          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
        ).show(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appText.titleWithInstruction(
                    context: context,
                    title: 'Verify Details',
                    instruction:
                        'Please ensure that all information you entered is correct.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: MemoryImage(
                        context.watch<TouristAuthProvider>().picture!),
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      BTReadonlyTextField(
                        label: 'First Name',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['first_name']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Last Name',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['last_name']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Gender',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['gender']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Nationality',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['nationality']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Date of Birth',
                        text:
                            '${DateFormat.yMMMMd().format(DateTime.parse(context.watch<TouristAuthProvider>().registeringTourist['date_of_birth'].toString()))}',
                      ),
                      BTReadonlyTextField(
                        label: 'Contact Number',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['contact_number']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Email Address',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['auth']['email']}',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      appText.heading(text: 'Permanent Address'),
                      BTReadonlyTextField(
                        label: 'Country',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['address']['country']}',
                      ),
                      BTReadonlyTextField(
                        label: 'State/Province',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['address']['state_province']}',
                      ),
                      BTReadonlyTextField(
                        label: 'City/Municipality',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['address']['city_municipality']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Address 1',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['address']['address_1']}',
                      ),
                      BTReadonlyTextField(
                        label: 'Address 2',
                        text:
                            '${context.watch<TouristAuthProvider>().registeringTourist['address']['address_2']}',
                      ),
                    ],
                  ),
                ),
                BTFullWidthButton(
                  onPressed: () async {
                    var touristProvider = Provider.of<TouristAuthProvider>(
                        context,
                        listen: false);
                    Tourist tourist = Tourist(
                        firstName:
                            touristProvider.registeringTourist['first_name'],
                        lastName:
                            touristProvider.registeringTourist['last_name'],
                        gender: touristProvider.registeringTourist['gender'],
                        nationality:
                            touristProvider.registeringTourist['nationality'],
                        dateOfBirth: touristProvider
                            .registeringTourist['date_of_birth']
                            .toString(),
                        contactNumber: touristProvider
                            .registeringTourist['contact_number'],
                        country: touristProvider.registeringTourist['address']
                            ['country'],
                        stateProvince: touristProvider
                            .registeringTourist['address']['state_province'],
                        cityMunicipality: touristProvider
                            .registeringTourist['address']['city_municipality'],
                        address1: touristProvider.registeringTourist['address']
                            ['address_1'],
                        address2: touristProvider.registeringTourist['address']
                            ['address_2'],
                        email: touristProvider.registeringTourist['auth']
                            ['email'],
                        password: touristProvider.registeringTourist['auth']
                            ['password'],
                        photoUrl:
                            'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSJYV5oxwGMJxH0jDyp7NqGOQN1yZ3EOu4wsayqJkyNjO2XHSXy');

                    setState(() {
                      loading = true;
                    });

                    await registerTourist(tourist);

                    await loginTourist(User(
                        email: tourist.email,
                        password: tourist.password,
                        userType: 1));

                    setState(() {
                      loading = false;
                    });
                  },
                  height: 50.0,
                  child: loading
                      ? const SpinKitRing(
                          color: Colors.white,
                          lineWidth: 3.0,
                          size: 25.0,
                        )
                      : Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        ),
                )
              ]),
        ),
      ),
    );
  }
}
