import 'package:flutter/material.dart';
import 'package:mert_erim_web/widgets/image_container.dart';
import 'package:mert_erim_web/widgets/informations.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.grey,
          child: const ImageContainer(),
        ),
        const Informations()
      ],
    );
  }
}
