// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/user_type_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/password_field.dart';
import 'package:bt_frontend/widgets/custom_text_field/text_field_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppColors appColor = AppColors();
  AppText appText = AppText();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String accType = 'Please choose account type';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: appBar(
        title: '',
      ),
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
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
                    Text(accType,
                        style: TextStyle(fontSize: 20.0, color: Colors.indigo))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BTUserTypeButton(
                        onPressed: () {
                          setState(() {
                            accType = 'Tourist';
                          });
                        },
                        icon: Icons.person_2_outlined,
                        label: 'Tourist'),
                    BTUserTypeButton(
                        onPressed: () {
                          setState(() {
                            accType = 'Establishment';
                          });
                        },
                        icon: Icons.store_outlined,
                        label: 'Establishment'),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BTTextFieldWithLabel(
                          textController: emailController,
                          label: 'Email Address',
                          placeholder: 'Enter your email address'),
                      BTPasswordField(
                        textController: passwordController,
                        label: 'Password',
                        placeholder: 'Enter your password',
                      )
                    ],
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
              BTFullWidthButton(
                height: 50.0,
                label: 'Login',
                onPressed: submitLogin,
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitLogin() {
    bool success = true;
    if (success && accType == 'Tourist') {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => TouristContainer()),
          (route) => false);
    }
    if (success && accType == 'Establishment') {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => EstablishmentContainer()),
          (route) => false);
    }
  }
}
