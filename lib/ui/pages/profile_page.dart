import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            customsnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 22, horizontal: 30),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: state.user.profilePicture == null
                                ? AssetImage(
                                    'assets/img_profile.png',
                                  )
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        ontap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/edit-profile');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_pin.png',
                        title: 'My Pin',
                        ontap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/edit-pin');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_wallet.png',
                        title: 'Wallet Setting',
                        ontap: () {},
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_reward.png',
                        title: 'My Reward',
                        ontap: () {},
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_help.png',
                        title: 'Help Center',
                        ontap: () {},
                      ),
                      ProfileMenuItem(
                        icon: 'assets/ic_logout.png',
                        title: 'Log Out',
                        ontap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 87,
                ),
                CustomTextWidget(
                  title: 'Report a Problem',
                  onpressed: () {},
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
