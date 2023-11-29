import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pincontroller = TextEditingController(text: '');
  String pin = '';
  bool isError = false;

  addpin(String number) {
    if (pincontroller.text.length < 6) {
      setState(() {
        isError = false;
        pincontroller.text = pincontroller.text + number;
      });
    }

    if (pincontroller.text.length == 6) {
      if (pincontroller.text.length == 6) {
        if (pincontroller.text == pin) {
          Navigator.pop(context, true);
        } else {
          setState(() {
            isError = true;
          });
          customsnackbar(
            context,
            'PIN yang anda masukkan salah. Silakan coba lagi.',
          );
        }
      }
    }
  }

  deletepin() {
    if (pincontroller.text.isNotEmpty) {
      setState(() {
        isError = false;
        pincontroller.text =
            pincontroller.text.substring(0, pincontroller.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha Pin',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pincontroller,
                  cursorColor: greyColor,
                  obscureText: true,
                  obscuringCharacter: '*',
                  style: whiteTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor,
                  ),
                  enabled: false,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
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
                      addpin('1');
                    },
                  ),
                  CustomInputButton(
                    title: '2',
                    ontap: () {
                      addpin('2');
                    },
                  ),
                  CustomInputButton(
                    title: '3',
                    ontap: () {
                      addpin('3');
                    },
                  ),
                  CustomInputButton(
                    title: '4',
                    ontap: () {
                      addpin('4');
                    },
                  ),
                  CustomInputButton(
                    title: '5',
                    ontap: () {
                      addpin('5');
                    },
                  ),
                  CustomInputButton(
                    title: '6',
                    ontap: () {
                      addpin('6');
                    },
                  ),
                  CustomInputButton(
                    title: '7',
                    ontap: () {
                      addpin('7');
                    },
                  ),
                  CustomInputButton(
                    title: '8',
                    ontap: () {
                      addpin('8');
                    },
                  ),
                  CustomInputButton(
                    title: '9',
                    ontap: () {
                      addpin('9');
                    },
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomInputButton(
                    title: '0',
                    ontap: () {
                      addpin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletepin();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
