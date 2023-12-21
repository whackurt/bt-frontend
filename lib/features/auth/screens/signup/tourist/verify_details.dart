// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations

import 'package:bot_toast/bot_toast.dart';
import 'package:bt_frontend/features/auth/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth/models/tourist.model.dart';
import 'package:bt_frontend/features/auth/models/user.model.dart';
import 'package:bt_frontend/features/auth/providers/tourist_auth.provider.dart';
import 'package:bt_frontend/features/tourist/tourist_container.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
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
      }
    });
  }

  Future registerTourist(Tourist tourist) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await AuthController().registerTourist(tourist).then((res) {
      if (res['success']) {
        BotToast.showText(text: 'Signed up successfully.');

        pref.setInt('userId', res['data']['id']['user_id']);
        pref.setInt('touristId', res['data']['id']['tourist_id']);
      } else {
        BotToast.showText(text: 'Email has already been taken.');
      }
    });
  }

  String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      onRefresh: () async {
        // getTouristData();
      },
      title: '',
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        appText.titleWithInstruction(
            context: context,
            title: 'Verify Details',
            instruction:
                'Please ensure that all information you entered is correct.'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: ClipOval(
            child: Image.file(
              context.watch<TouristAuthProvider>().picture!,
              fit: BoxFit.cover, // Adjust the BoxFit as needed
              width: 170, // Set the width and height as needed
              height: 170,
            ),
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
            setState(() {
              loading = true;
            });

            var touristProvider =
                Provider.of<TouristAuthProvider>(context, listen: false);

            var imageUrl =
                await AuthController().uploadImage(touristProvider.picture);

            setState(() {
              imgUrl = imageUrl;
            });

            Tourist tourist = Tourist(
                firstName: touristProvider.registeringTourist['first_name'],
                lastName: touristProvider.registeringTourist['last_name'],
                gender: touristProvider.registeringTourist['gender'],
                nationality: touristProvider.registeringTourist['nationality'],
                dateOfBirth: touristProvider.registeringTourist['date_of_birth']
                    .toString(),
                contactNumber:
                    touristProvider.registeringTourist['contact_number'],
                country: touristProvider.registeringTourist['address']
                    ['country'],
                stateProvince: touristProvider.registeringTourist['address']
                    ['state_province'],
                cityMunicipality: touristProvider.registeringTourist['address']
                    ['city_municipality'],
                address1: touristProvider.registeringTourist['address']
                    ['address_1'],
                address2: touristProvider.registeringTourist['address']
                    ['address_2'],
                email: touristProvider.registeringTourist['auth']['email'],
                password: touristProvider.registeringTourist['auth']
                    ['password'],
                photoUrl: '$imageUrl');

            await registerTourist(tourist);

            await loginTourist(User(
                email: tourist.email, password: tourist.password, userType: 1));

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
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
        )
      ]),
    );
  }
}
