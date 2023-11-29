import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? ontap;
  const ProfileMenuItem({
    key,
    required this.icon,
    required this.title,
     this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
            ),
            SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
