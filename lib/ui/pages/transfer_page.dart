import 'package:bank/blocs/user/user_bloc.dart';
import 'package:bank/models/user_model.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:bank/ui/widgets/transfer_result_user_item.dart';
import 'package:bank/ui/widgets/transfer_user_recent_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernamecontroller = TextEditingController(text: '');
  UserModel? selectedZUser;

  late UserBloc userbloc;

  @override
  void initState() {
    super.initState();

    userbloc = context.read<UserBloc>()..add(getuserrecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 34),
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
            title: 'by Username',
            showtitle: false,
            controller: usernamecontroller,
            onfieldsubmited: (value) {
              if (value.isNotEmpty) {
                userbloc.add(getuserbyusername(value));
              } else {
                selectedZUser = null;
                userbloc.add(getuserrecent());
              }

              setState(() {});
            },
          ),
          usernamecontroller.text.isEmpty ? buildrecentuser() : buildresult(),
          SizedBox(
            height: 274,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: selectedZUser != null
          ? Container(
              margin: EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onpressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildrecentuser() {
    return Container(
      margin: EdgeInsets.only(
        top: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSucces) {
                Column(
                  children: state.user.map(
                    (user) {
                      return TransferRecentUserItem(user: user);
                    },
                  ).toList(),
                );
                print(state.user.toList());
              } else {
                Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget buildresult() {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSucces) {
                Wrap(
                  runSpacing: 14,
                  spacing: 14,
                  children: state.user
                      .map(
                        (user) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedZUser = user;
                            });
                          },
                          child: TransferResultItem(
                            user: user,
                            isselected: user.id == selectedZUser?.id,
                          ),
                        ),
                      )
                      .toList(),
                );
                print(state.user.toString());
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
