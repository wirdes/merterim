import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mert_erim_web/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

class Informations extends StatelessWidget {
  const Informations({super.key});
  _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final size = ViewportContainer.of(context).type == ViewportHelpers.desktop
        ? MediaQuery.of(context).size.width * 0.7
        : MediaQuery.of(context).size.height * 1.5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.6,
          child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data.toString(),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future:
                  rootBundle.loadString("assets/markdowns/informations.md")),
        ),
        const SizedBox(
          height: 15,
        ),
        Text("🤝🏻 Connect with Me",
            style:
                TextStyle(fontSize: size * 0.015, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () => _launchURL("https://www.linkedin.com/in/m-erim/"),
                child: Icon(FontAwesomeIcons.linkedin, size: size * 0.05)),
            const SizedBox(
              width: 10,
            ),
            InkWell(
                onTap: () => _launchURL("https://github.com/wirdes"),
                child: Icon(
                  FontAwesomeIcons.github,
                  size: size * 0.05,
                )),
          ],
        )
      ],
    );
  }
}
