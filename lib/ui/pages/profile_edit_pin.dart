import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPin extends StatefulWidget {
  const EditPin({key});

  @override
  State<EditPin> createState() => _EditPinState();
}

class _EditPinState extends State<EditPin> {
  final NewpinController = TextEditingController(text: '');
  final OldpinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pin'),
      ),
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            customsnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/edit-profile-succes', (route) => false);
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
                    //Username
                    CustomFormField(
                      title: 'Old Pin',
                      controller: OldpinController,
                      obsecuretext: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //FULL NAME
                    CustomFormField(
                      title: 'New Pin',
                      controller: NewpinController,
                      obsecuretext: true,
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Update Now',
                      onpressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                OldpinController.text,
                                NewpinController.text,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
