// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/auth/controllers/auth.controller.dart';
import 'package:bt_frontend/features/auth/models/user.model.dart';
import 'package:bt_frontend/features/establishment/establishment_container.dart';
import 'package:bt_frontend/features/tourist/tourist_container.dart';
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
      backgroundColor: PropValues().main,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  // color: Colors.red[400],
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 233, 233),
                  )),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Image(
                          width: 130.0,
                          height: 130.0,
                          image: AssetImage('assets/images/app-icon.png')),
                      Text(
                        'Bantay Turista',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                height: 400.0,
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.indigo]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0))),
                  child: Column(
                    children: [
                      Image(
                          width: 130.0,
                          height: 130.0,
                          image: AssetImage('assets/images/app-icon.png')),
                      Text(
                        'Camiguin\nBantay Turista',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 190,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 249, 249),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                              color: Colors.indigo),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedUser = 'Tourist';
                                    userNotSelected = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        PropValues().borderRadius),
                                  ),
                                  backgroundColor: Color.fromARGB(255, 247, 247,
                                      247), // Set the background color to white
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      size: 80.0,
                                      color: selectedUser == 'Tourist'
                                          ? Colors.red[300]
                                          : Color.fromARGB(255, 97, 97, 97),
                                    ),
                                    Text(
                                      'Tourist',
                                      style: TextStyle(
                                        color: selectedUser == 'Tourist'
                                            ? Colors.red[300]
                                            : Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedUser = 'Establishment';
                                    userNotSelected = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        PropValues().borderRadius),
                                  ),
                                  backgroundColor: Color.fromARGB(255, 247, 247,
                                      247), // Set the background color to white
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.domain,
                                      size: 80.0,
                                      color: selectedUser == 'Establishment'
                                          ? Colors.red[300]
                                          : Color.fromARGB(255, 97, 97, 97),
                                    ),
                                    Text(
                                      'Establishment',
                                      style: TextStyle(
                                        color: selectedUser == 'Establishment'
                                            ? Colors.red[300]
                                            : Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: userNotSelected
                              ? Text(
                                  'Please select user type.',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.red[400]),
                                )
                              : SizedBox(),
                        ),
                        Column(
                          children: [
                            Form(
                              key: _loginKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BTTextFieldWithLabel(
                                      controller: emailController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email address is required.';
                                        }
                                        final emailRegex = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      label: 'Email Address',
                                      placeholder: 'Enter your email address'),
                                  BTPasswordField(
                                    validator: (value) => value!.isEmpty
                                        ? 'Password is required.'
                                        : null,
                                    controller: passwordController,
                                    label: 'Password',
                                    placeholder: 'Enter your password',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New to Bantay Turista?',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/signup/select');
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800),
                                  ))
                            ],
                          ),
                        ),
                        BTFullWidthButton(
                          height: 50.0,
                          onPressed: () async {
                            if (!userNotSelected) {
                              if (_loginKey.currentState!.validate()) {
                                await login(User(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    userType:
                                        selectedUser == 'Tourist' ? 1 : 2));
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
                                      color: Colors.white, fontSize: 18.0),
                                ),
                        )
                        // child: ,
                      ]),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
