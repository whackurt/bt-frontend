// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bt_frontend/features/auth_features/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth_features/models/establishment.model.dart';
import 'package:bt_frontend/features/auth_features/models/user.model.dart';
import 'package:bt_frontend/features/auth_features/providers/establishment_auth.provider.dart';
import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EstablishmentVerifyDetails extends StatefulWidget {
  const EstablishmentVerifyDetails({super.key});

  @override
  State<EstablishmentVerifyDetails> createState() =>
      _EstablishmentVerifyDetailsState();
}

class _EstablishmentVerifyDetailsState
    extends State<EstablishmentVerifyDetails> {
  AppText appText = AppText();

  bool loading = false;
  bool error = false;

  Future loginEstablishment(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await AuthController().login(user).then((res) {
      if (res['success']) {
        pref.setString('token', res['data']['token']);
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => const EstablishmentContainer()),
            (route) => false);
      }
    });
  }

  Future registerEstablishment(Establishment establishment) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await AuthController().registerEstablishment(establishment).then((res) {
      if (res['success']) {
        pref.setInt('userId', res['data']['id']['user_id']);
        pref.setInt('establishmentId', res['data']['id']['establishment_id']);
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
    final estAuthProvider = context.watch<EstablishmentAuthProvider>();

    return BTContentWrapper(
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
              context.watch<EstablishmentAuthProvider>().picture!,
              fit: BoxFit.cover, // Adjust the BoxFit as needed
              width: 200, // Set the width and height as needed
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              BTReadonlyTextField(
                label: 'Establishment Name',
                text: '${estAuthProvider.registeringEstablishment['name']}',
              ),
              BTReadonlyTextField(
                label: 'Establishment Type',
                text:
                    '${estAuthProvider.registeringEstablishment['type_name']}',
              ),
              BTReadonlyTextField(
                label: 'Email Address',
                text: '${estAuthProvider.registeringEstablishment['email']}',
              ),
              BTReadonlyTextField(
                label: 'Contact No.',
                text:
                    '${estAuthProvider.registeringEstablishment['contact_number']}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              appText.heading(text: 'Location'),
              BTReadonlyTextField(
                label: 'City/Municipality',
                text:
                    '${estAuthProvider.registeringEstablishment['city_municipality']}',
              ),
              BTReadonlyTextField(
                label: 'Barangay',
                text: '${estAuthProvider.registeringEstablishment['barangay']}',
              ),
              BTReadonlyTextField(
                label: 'Address 1',
                text:
                    '${estAuthProvider.registeringEstablishment['address_1']}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              appText.heading(text: 'Owner\'s Information'),
              BTReadonlyTextField(
                label: 'Name',
                text:
                    '${estAuthProvider.registeringEstablishment['owner_name']}',
              ),
              BTReadonlyTextField(
                label: 'Email Address',
                text:
                    '${estAuthProvider.registeringEstablishment['owner_email']}',
              ),
              BTReadonlyTextField(
                label: 'Contact No.',
                text:
                    '${estAuthProvider.registeringEstablishment['owner_phone']}',
              ),
            ],
          ),
        ),
        BTFullWidthButton(
          onPressed: () async {
            var estProvider = Provider.of<EstablishmentAuthProvider>(
              context,
              listen: false,
            );

            var imageUrl =
                await AuthController().uploadImage(estProvider.picture);

            Establishment establishment = Establishment(
                name: estProvider.registeringEstablishment['name'],
                email: estProvider.registeringEstablishment['email'],
                password: estProvider.registeringEstablishment['password'],
                contactNo:
                    estProvider.registeringEstablishment['contact_number'],
                type:
                    int.parse(estProvider.registeringEstablishment['type_id']),
                cityMunicipality:
                    estProvider.registeringEstablishment['city_municipality'],
                barangay: estProvider.registeringEstablishment['barangay'],
                address1: estProvider.registeringEstablishment['address_1'],
                oName: estProvider.registeringEstablishment['owner_name'],
                oEmail: estProvider.registeringEstablishment['owner_email'],
                oContactNo: estProvider.registeringEstablishment['owner_phone'],
                photoUrl: "$imageUrl");

            setState(() {
              loading = true;
            });

            await registerEstablishment(establishment);

            await loginEstablishment(User(
                email: establishment.email,
                password: establishment.password,
                userType: 2));

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
    );
  }
}
