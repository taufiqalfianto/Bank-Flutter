import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/models/sign_in_form_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final emailcontroller = TextEditingController(text: '');
final passwordcontroller = TextEditingController(text: '');

bool validate() {
  if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty) {
    return false;
  }

  return true;
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          customsnackbar(context, state.e);
        }

        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 100),
              width: 155,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light.png'),
                ),
              ),
            ),
            Text(
              'Sign In &\nGrow Your Finance',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //EMAIL
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailcontroller,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //PASSWORD
                  CustomFormField(
                    title: 'Password',
                    obsecuretext: true,
                    controller: passwordcontroller,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Sign In',
                    onpressed: () {
                      print(state.toString());
                      if (validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                SignInFormModel(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                ),
                              ),
                            );
                      } else {
                        customsnackbar(
                          context,
                          'semua field harus diisi',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextWidget(
              title: 'Create New Account',
              onpressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
          ],
        );
      },
    ));
  }
}
