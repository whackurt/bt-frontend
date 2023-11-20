import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/material.dart';

class BTContentWrapper extends StatefulWidget {
  final String? title;
  final Widget? child;
  const BTContentWrapper({super.key, this.title, this.child});

  @override
  State<BTContentWrapper> createState() => _BTContentWrapperState();
}

class _BTContentWrapperState extends State<BTContentWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: appBar(title: widget.title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: widget.child,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
