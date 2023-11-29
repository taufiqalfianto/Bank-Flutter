import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beli Data',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Balance: Rp ${formatcurrency(180000000)}',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          DataProviderItem(
            imgUrl: 'assets/img_provider_telkomsel.png',
            provider: 'Telkomsel',
            status: 'Available',
            isvalidate: true,
          ),
          DataProviderItem(
            imgUrl: 'assets/img_provider_indosat.png',
            provider: 'Indosat Oreedo',
            status: 'Available',
          ),
          DataProviderItem(
            imgUrl: 'assets/img_provider_singtel.png',
            provider: 'Singtel Id',
            status: 'Available',
          ),
          SizedBox(
            height: 135,
          ),
          CustomFilledButton(
            title: 'Continue',
            onpressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
