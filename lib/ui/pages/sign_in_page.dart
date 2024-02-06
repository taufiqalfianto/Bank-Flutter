import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/models/sign_in_form_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
              width: 25.h,
              height: 8.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light.png'),
                ),
              ),
            ),
            Text(
              'Sign In &\nGrow Your Finance',
              style: blackTextStyle.copyWith(
                fontSize: 15.sp,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
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
                    height: 3.h,
                  ),
                  //PASSWORD
                  CustomFormField(
                    title: 'Password',
                    obsecuretext: true,
                    controller: passwordcontroller,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle.copyWith(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
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
              height: 7.h,
            ),
            CustomTextWidget(
              title: 'Create New Account',
              onpressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        );
      },
    ));
  }
}
