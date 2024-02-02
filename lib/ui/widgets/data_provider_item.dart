import 'package:bank/models/operator_card_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  final OperatorCardModel operatorcard;
  final bool isselected;
  const DataProviderItem({
    key,
    required this.operatorcard,
    this.isselected = false,
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
          color: isselected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Image.network(
            operatorcard.thumbnail.toString(),
            height: 30,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorcard.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                operatorcard.status.toString(),
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
