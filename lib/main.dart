import 'package:flutter/material.dart';
import 'package:mert_erim_web/utils/util.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ViewportContainer(
        mobileChild: mobile(),
        child: desktop(MediaQuery.of(context).size),
      )),
    );
  }

  Widget mobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey,
          child: image(),
        ),
        list()
      ],
    );
  }

  Widget desktop(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: size.width * 0.2,
            height: size.height,
            color: Colors.grey,
            child: image()),
        list()
      ],
    );
  }
}

Row list() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
    SizedBox(
      width: 50,
    ),
    Text(
      "MERT",
      style: TextStyle(fontSize: 75, fontWeight: FontWeight.bold),
    ),
    SizedBox(
      width: 20,
    ),
    Text(
      "ERİM",
      style: TextStyle(
          fontSize: 75, fontWeight: FontWeight.bold, color: Colors.grey),
    ),
  ]);
}

Widget image() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          width: 190.0,
          height: 190.0,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://i.imgur.com/BoN9kdC.png")))),
    ],
  );
}
