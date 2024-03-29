import 'package:flutter/material.dart';
import 'package:mert_erim_web/components/desktop.dart';
import 'package:mert_erim_web/components/mobile.dart';
import 'package:mert_erim_web/utils/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(title: "Mert Erim", home: MyApp()));
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
