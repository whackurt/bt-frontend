// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/auth_features/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth_features/models/user.model.dart';
import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppColors appColor = AppColors();
  AppText appText = AppText();
  final AuthController authController = AuthController();
  final _loginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedUser;
  bool userNotSelected = true;
  bool loading = false;

  Future login(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    await authController.login(user).then((res) {
      if (res['success']) {
        pref.setString('token', res['data']['token']);
        pref.setInt('userId', res['data']['id']['userId']);

        user.userType == 1
            ? pref.setInt('touristId', res['data']['id']['touristId'])
            : pref.setInt(
                'establishmentId', res['data']['id']['establishmentId']);

        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => user.userType == 1
                    ? TouristContainer()
                    : EstablishmentContainer()),
            (route) => false);
      } else {
        AnimatedSnackBar.material(
          '${res['data']['message']}',
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top,
          desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
        ).show(context);
      }

      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: '',
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: appText.title(text: 'Login'),
                    ),
                    Center(
                      child: userNotSelected
                          ? Text(
                              'Please select user type.',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.red[600]),
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4.0,
                                color: selectedUser == 'Tourist'
                                    ? Colors.indigo
                                    : Color.fromARGB(255, 97, 97, 97)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedUser = 'Tourist';
                                userNotSelected = false;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    size: 100.0,
                                    color: selectedUser == 'Tourist'
                                        ? Colors.indigo
                                        : Color.fromARGB(255, 97, 97, 97),
                                  ),
                                  Text(
                                    'Tourist',
                                    style: TextStyle(
                                        color: selectedUser == 'Tourist'
                                            ? Colors.indigo
                                            : Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),

                    // user type buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4.0,
                                color: selectedUser == 'Establishment'
                                    ? Colors.indigo
                                    : Color.fromARGB(255, 97, 97, 97)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedUser = 'Establishment';
                                userNotSelected = false;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.domain,
                                    size: 100.0,
                                    color: selectedUser == 'Establishment'
                                        ? Colors.indigo
                                        : Color.fromARGB(255, 97, 97, 97),
                                  ),
                                  Text(
                                    'Establishment',
                                    style: TextStyle(
                                        color: selectedUser == 'Establishment'
                                            ? Colors.indigo
                                            : Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Form(
                    key: _loginKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BTTextFieldWithLabel(
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
                            },
                            label: 'Email Address',
                            placeholder: 'Enter your email address'),
                        BTPasswordField(
                          validator: (value) =>
                              value!.isEmpty ? 'Password is required.' : null,
                          controller: passwordController,
                          label: 'Password',
                          placeholder: 'Enter your password',
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to Bantay Turista?',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup/select');
                            },
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w800),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              BTFullWidthButton(
                height: 50.0,
                onPressed: () async {
                  if (!userNotSelected) {
                    if (_loginKey.currentState!.validate()) {
                      await login(User(
                          email: emailController.text,
                          password: passwordController.text,
                          userType: selectedUser == 'Tourist' ? 1 : 2));
                    }
                  }
                },
                child: loading
                    ? const SpinKitRing(
                        color: Colors.white,
                        lineWidth: 3.0,
                        size: 25.0,
                      )
                    : Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
