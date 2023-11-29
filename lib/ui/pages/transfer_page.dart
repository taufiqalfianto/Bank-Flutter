import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:bank/ui/widgets/transfer_result_user_item.dart';
import 'package:bank/ui/widgets/transfer_user_recent_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 34),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by Username',
            showtitle: false,
          ),
          buildresult(),
          SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onpressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildrecentuser() {
    return Container(
      margin: EdgeInsets.only(
        top: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isverified: true,
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'John Hi',
            username: 'jhi',
          ),
          TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Masayoshi',
            username: 'form',
          ),
        ],
      ),
    );
  }

  Widget buildresult() {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            runSpacing: 14,
            spacing: 14,
            children: [
              TransferResultItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'Yonna Jie',
                username: 'yoenna',
                isverified: true,
              ),
              TransferResultItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Yonna Jie',
                username: 'yoenna',
                isselected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
