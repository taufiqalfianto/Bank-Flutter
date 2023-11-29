import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/models/sign_up_form_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final namecontroller = TextEditingController(text: '');
  final emailcontroller = TextEditingController(text: '');
  final passwordcontroller = TextEditingController(text: '');

  bool validate() {
    if (namecontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            customsnackbar(context, state.e);
          }

          if (state is AuthCheckEmailSucces) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                    data: SignUpFormModel(
                  email: emailcontroller.text,
                  name: namecontroller.text,
                  password: passwordcontroller.text,
                )),
              ),
            );
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
                'Join Us to Unlock\nYour Growth',
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
                    //FULL NAME
                    CustomFormField(
                      title: 'Full Name',
                      controller: namecontroller,
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onpressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailcontroller.text));
                        } else {
                          customsnackbar(
                            context,
                            'Kolom harus diisi',
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
                title: 'Sign In',
                onpressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          );
        },
      ),
    );
  }
}
