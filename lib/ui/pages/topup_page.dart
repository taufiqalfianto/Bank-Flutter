// import 'package:bank/blocs/payment/bloc/payment_bloc.dart';
import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/payment/bloc/payment_method_bloc.dart';
import 'package:bank/models/payment_method_model,.dart';
import 'package:bank/models/topup_form_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/topup_amount_page.dart';
import 'package:bank/ui/widgets/bank_item.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedpaymentmethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
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
                          state.user.cardNumber!.replaceAllMapped(
                            RegExp(r'.{4}'),
                            (match) => "${match.group(0)} ",
                          ),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Selected Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()
              ..add(
                PaymentMethodGet(),
              ),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSucces) {
                  return Column(
                      children: state.paymentmethod.map((paymentmethod) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedpaymentmethod = paymentmethod;
                          });
                        },
                        child: BankItem(
                          paymentmethod: paymentmethod,
                          isSelected:
                              paymentmethod.id == selectedpaymentmethod?.id,
                        ));
                  }).toList());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
      floatingActionButton: (selectedpaymentmethod != null)
          ? Container(
              margin: EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'continue',
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopupAmountPage(
                        data: TopupFormModel(
                          paymentMethod: selectedpaymentmethod?.code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
