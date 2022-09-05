import 'package:flutter/material.dart';
import 'package:mert_erim_web/components/desktop.dart';
import 'package:mert_erim_web/components/mobile.dart';
import 'package:mert_erim_web/utils/util.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ViewportContainer(
        mobileChild: Mobile(),
        child: Desktop(),
      )),
    );
  }
}
