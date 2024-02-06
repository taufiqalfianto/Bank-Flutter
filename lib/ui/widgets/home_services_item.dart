import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeServicesItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? ontap;
  const HomeServicesItem({
    key,
    required this.iconUrl,
    required this.title,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 7.w,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 11.sp,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
