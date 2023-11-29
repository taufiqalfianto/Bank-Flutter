import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:bank/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paket Data',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
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
            title: '+628',
            showtitle: false,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Package',
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
              PackageItem(
                amount: 10,
                price: 218000,
              ),
              PackageItem(
                amount: 25,
                price: 420000,
              ),
              PackageItem(
                amount: 40,
                price: 2500000,
                isselected: true,
              ),
              PackageItem(
                amount: 99,
                price: 5000000,
              ),
            ],
          ),
          SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: 'Continue',
            onpressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/data-succes', (route) => false);
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
