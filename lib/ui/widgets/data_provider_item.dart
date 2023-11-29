import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final String imgUrl;
  final String provider;
  final String status;
  final bool isvalidate;
  const DataProviderItem({
    key,
    required this.imgUrl,
    required this.provider,
    required this.status,
    this.isvalidate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 87,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          color: isvalidate ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imgUrl,
            height: 30,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                provider,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                status,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
