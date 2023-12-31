import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/material.dart';

class BTContentWrapper extends StatefulWidget {
  final String? title;
  final Widget? child;
  final Future<void> Function() onRefresh;
  const BTContentWrapper(
      {super.key, this.title, this.child, required this.onRefresh});

  @override
  State<BTContentWrapper> createState() => _BTContentWrapperState();
}

class _BTContentWrapperState extends State<BTContentWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PropValues().main,
      appBar: appBar(title: widget.title),
      body: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: SingleChildScrollView(
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
      ),
    );
  }
}
