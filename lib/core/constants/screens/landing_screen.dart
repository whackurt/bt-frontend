// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bt_frontend/widgets/wrapper/init_wrapper.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: InitWrapper(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    width: 150.0,
                    height: 150.0,
                    image: AssetImage('assets/images/app-icon.png')),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: SizedBox(
                        height: 50.0,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup/select');
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.indigo)),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
