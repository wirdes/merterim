import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mert_erim_web/screen/components/windows_desktop_element.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopElements extends StatelessWidget {
  final Function(String, ImageProvider) onElementTap;

  const DesktopElements({
    super.key,
    required this.onElementTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WindowsDesktopElement(
            title: 'Bu bilgisayar',
            image: const AssetImage('assets/w11/Personalization.png'),
            onTap: () => onElementTap(
              'Bu bilgisayar',
              const AssetImage('assets/w11/Personalization.png'),
            ),
          ),
          WindowsDesktopElement(
            title: 'Çöp Kutusu',
            image: const AssetImage('assets/w11/trashEmpty.png'),
            onTap: () => onElementTap(
                'Çöp Kutusu', const AssetImage('assets/w11/trashEmpty.png')),
          ),
          WindowsDesktopElement(
            title: 'Ayarlar',
            image: const AssetImage('assets/w11/Settings.png'),
            onTap: () => onElementTap(
                'Ayarlar', const AssetImage('assets/w11/Settings.png')),
          ),
          WindowsDesktopElement(
            title: 'CV indir',
            image: const AssetImage('assets/w11/pdf.png'),
            onTap: () async {
              const url = kDebugMode
                  ? 'http://localhost:8080/#/assets/assets/cv/cv-2.pdf'
                  : 'https://merterim.dev/assets/assets/cv/cv-2.pdf';
              launchUrl(
                Uri.parse(url),
              );
            },
          ),
          WindowsDesktopElement(
            title: 'Github',
            image: const AssetImage('assets/w11/github-mark.png'),
            onTap: () => launchUrl(Uri.parse("https://github.com/wirdes")),
          ),
        ],
      ),
    );
  }
}
