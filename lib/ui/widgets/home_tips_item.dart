import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsitem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;
  const HomeTipsitem({
    key,
    required this.imageUrl,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          launchUrl(Uri.parse(url));
        }
      },
      child: Container(
        height: height / 4,
        width: width / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                imageUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
