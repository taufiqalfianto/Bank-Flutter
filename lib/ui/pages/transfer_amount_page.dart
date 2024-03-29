import 'package:bank/blocs/transfer/transfer_bloc.dart';
import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../blocs/auth/auth_bloc.dart';

class TransferAmountPage extends StatefulWidget {
  final TransferFormModel data;
  TransferAmountPage({key, required this.data});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountcontroller =
      TextEditingController(text: '0');

  addamount(String number) {
    if (amountcontroller.text == '0') {
      amountcontroller.text = '';
    }
    setState(() {
      amountcontroller.text = amountcontroller.text + number;
    });
  }

  deleteamount() {
    if (amountcontroller.text.isNotEmpty) {
      setState(() {
        amountcontroller.text = amountcontroller.text
            .substring(0, amountcontroller.text.length - 1);

        if (amountcontroller.text == '') {
          amountcontroller.text = '0';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    amountcontroller.addListener(
      () {
        final text = amountcontroller.text;
        amountcontroller.value = amountcontroller.value.copyWith(
          text: NumberFormat.currency(
            locale: 'id',
            decimalDigits: 0,
            symbol: '',
          ).format(
            int.tryParse(
              text.replaceAll('.', ''),
            ),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) async {
            if (state is TransferFailed) {
              customsnackbar(context, state.e);
            }

            if (state is TransferSucces) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(
                      int.parse(
                            amountcontroller.text.replaceAll('.', ''),
                          ) *
                          -1,
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/topup-succes', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              children: [
                SizedBox(
                  height: 36,
                ),
                Center(
                  child: Text(
                    'Total Amount',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 67,
                ),
                Align(
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: amountcontroller,
                      cursorColor: greyColor,
                      style: whiteTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: medium,
                      ),
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'RP. ',
                          style: whiteTextStyle.copyWith(
                            fontSize: 30,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 66,
                ),
                Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    CustomInputButton(
                      title: '1',
                      ontap: () {
                        addamount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      ontap: () {
                        addamount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      ontap: () {
                        addamount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      ontap: () {
                        addamount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      ontap: () {
                        addamount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      ontap: () {
                        addamount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      ontap: () {
                        addamount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      ontap: () {
                        addamount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      ontap: () {
                        addamount('9');
                      },
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      ontap: () {
                        addamount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteamount();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: numberBackgroundColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onpressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';

                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TransferBloc>().add(
                            Transfer(
                              widget.data.copywith(
                                pin: pin,
                                amount:
                                    amountcontroller.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextWidget(
                  title: 'Terms & Condition',
                  onpressed: () {},
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
