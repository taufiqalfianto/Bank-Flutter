import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/operatorcard/operatorcard_bloc.dart';
import 'package:bank/models/operator_card_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/data_package_page.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedoperator;
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                            RegExp(r'.{4}'),
                            (match) => "${match.group(0)} ",
                          ),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Balance: Rp ${formatcurrency(state.user.balance!)}',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
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
          BlocProvider(
            create: (context) => OperatorCardBloc()
              ..add(
                GetOperatoeCard(),
              ),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                print(state);
                if (state is OperatorCardSucces) {
                  return Column(
                    children: state.operators.map(
                      (getoperator) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedoperator = getoperator;
                            });
                          },
                          child: DataProviderItem(
                            operatorcard: getoperator,
                            isselected: getoperator.id == selectedoperator?.id,
                          ),
                        );
                      },
                    ).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(
            height: 135,
          ),
        ],
      ),
      floatingActionButton: (selectedoperator != null)
          ? Container(
              margin: EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'continue',
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPackagePage(
                        operatorcard: selectedoperator!,
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
