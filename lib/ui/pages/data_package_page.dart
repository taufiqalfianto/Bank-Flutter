import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/dataplan/dataplan_bloc.dart';
import 'package:bank/models/data_plan_form_model.dart';
import 'package:bank/models/data_plan_model.dart';
import 'package:bank/models/operator_card_model.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:bank/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorcard;
  const DataPackagePage({key, required this.operatorcard});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phonecontroller = TextEditingController(text: '');
  DataPlanModel? selecteddataplan;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataplanBloc(),
      child: BlocConsumer<DataplanBloc, DataplanState>(
        listener: (context, state) {
          if (state is DataplanFailed) {
            customsnackbar(context, state.e);
          }

          if (state is DataplanSucces) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selecteddataplan!.price! * -1,
                  ),
                );

            Navigator.pushNamedAndRemoveUntil(
                context, '/topup-succes', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataplanLOading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Paket Data',
                ),
              ),
              floatingActionButton: (selecteddataplan != null)
                  ? Container(
                      margin: EdgeInsets.all(24),
                      child: CustomFilledButton(
                        title: 'continue',
                        onpressed: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            final authState = context.read<AuthBloc>().state;
                            String pin = '';

                            if (authState is AuthSuccess) {
                              pin = authState.user.pin!;
                            }

                            context.read<DataplanBloc>().add(
                                  DataPlanPost(
                                    DataPlanFormModel(
                                      id: selecteddataplan?.id,
                                      phonenumber: phonecontroller.text,
                                      pin: pin,
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                    )
                  : Container(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButtonAnimator:
                  FloatingActionButtonAnimator.scaling,
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
                    title: '+62',
                    controller: phonecontroller,
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
                    children: widget.operatorcard.dataPlans!.map((dataPlan) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selecteddataplan = dataPlan;
                          });
                        },
                        child: PackageItem(
                          dataplan: dataPlan,
                          isselected: dataPlan.id == selecteddataplan?.id,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 85,
                  ),
                ],
              ));
        },
      ),
    );
  }
}
