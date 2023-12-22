// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:bt_frontend/widgets/wrapper/init_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void showLoading() {}

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/landing');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitWrapper(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 270.0,
                  height: 270.0,
                  image: AssetImage('assets/images/icon-group.png')),
              SpinKitRing(
                color: Colors.white,
                size: 40.0,
                lineWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
