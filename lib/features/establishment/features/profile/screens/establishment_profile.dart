import 'package:bot_toast/bot_toast.dart';
import 'package:bt_frontend/features/auth/screens/login/login_screen.dart';
import 'package:bt_frontend/features/auth/services/est_auth.services.dart';
import 'package:bt_frontend/features/establishment/features/profile/controllers/establishment_profile.controller.dart';
import 'package:bt_frontend/features/establishment/features/profile/screens/update_profile.dart';
import 'package:bt_frontend/features/establishment/providers/est_profile.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';

class BTEstProfile extends StatefulWidget {
  const BTEstProfile({super.key});

  @override
  State<BTEstProfile> createState() => _BTEstProfileState();
}

class _BTEstProfileState extends State<BTEstProfile> {
  AppText appText = AppText();
  EstablishmentProfileController estProfileController =
      EstablishmentProfileController();
  EstablishmentAuthServices establishmentAuthServices =
      EstablishmentAuthServices();

  bool loading = false;
  Map userProfile = {};
  List? estTypes = [];

  void logout(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.clear();

    BotToast.showText(text: 'Logged out.');

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

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

  @override
  void initState() {
    super.initState();
    getEstablishmentTypes();
    getEstablishmentProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var estProvider =
        Provider.of<EstablishmentProfileProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: PropValues().main,
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      Row(
                        children: [
                          AppText().purpleBoldHeader(text: 'Profile'),
                        ],
                      ),
                      Row(
                        children: [
                          AppText().subHeader(
                            context: context,
                            text: 'Your Establishment Information',
                          ),
                        ],
                      ),
                      const Divider(
                        height: 30.0,
                      ),
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: estProvider.profileData['photo_url'] !=
                                    null &&
                                estProvider.profileData['photo_url'].isNotEmpty
                            ? NetworkImage(estProvider.profileData['photo_url'])
                                as ImageProvider
                            : const AssetImage(
                                'assets/images/app-icon.png'), // Use a placeholder image
                        backgroundColor:
                            const Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            BTReadonlyTextField(
                              label: 'Establishment Name',
                              text: '${estProvider.profileData['name']}',
                            ),
                            BTReadonlyTextField(
                              label: 'Establishment Type',
                              text: estTypes?.firstWhere(
                                (eType) =>
                                    eType['id'] ==
                                    estProvider.profileData['type_id'],
                                orElse: () => {'value': 'Item not found'},
                              )['name'],
                            ),
                            BTReadonlyTextField(
                              label: 'Contact Number',
                              text:
                                  '${estProvider.profileData['contact_number']}',
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
                                  '${estProvider.profileData['city_municipality']}',
                            ),
                            BTReadonlyTextField(
                              label: 'Barangay',
                              text: '${estProvider.profileData['barangay']}',
                            ),
                            BTReadonlyTextField(
                              label: 'Address 1',
                              text:
                                  '${estProvider.profileData['address_1'] ?? ''}',
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
                              text: '${estProvider.profileData['owner_name']}',
                            ),
                            BTReadonlyTextField(
                              label: 'Email Address',
                              text: '${estProvider.profileData['owner_email']}',
                            ),
                            BTReadonlyTextField(
                              label: 'Phone Number',
                              text: '${estProvider.profileData['owner_phone']}',
                            ),
                          ],
                        ),
                      ),
                      BTFullWidthButton(
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context) {
                              return const BTEstablishmentUpdateProfile();
                            },
                          ));
                        },
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.penToSquare,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Update Profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: PropValues().btnTextSize),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      BTRedBtnWithBorder(
                        icon: FontAwesomeIcons.arrowRightFromBracket,
                        labelText: 'Log out',
                        action: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Log out',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  content: const Text(
                                      'Are you sure you want to log out?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the alert dialog
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        logout(context);
                                      },
                                      child: const Text(
                                        'Log out',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              }));
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
