import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/history_transaction/history_transaction_bloc.dart';
import 'package:bank/shared/shared_method.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank/ui/widgets/home_services_item.dart';
import 'package:bank/ui/widgets/home_tips_item.dart';
import 'package:bank/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 12,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 24,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 24,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_statistic.png',
                width: 24,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 24,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildprofile(context),
          buildwalletcard(),
          buildlevel(),
          buildservices(context),
          buildlatesttransaction(),
          buildsendagain(),
          buildfriendlytips(),
        ],
      ),
    );
  }

  Widget buildprofile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'shaynahan',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
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
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildwalletcard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 220,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_bg_card.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                    letterSpacing: 6,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Reguler',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  formatcurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildlevel() {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                ' of ${formatcurrency(20000)}',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildservices(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                ontap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                ontap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                ontap: () {},
              ),
              HomeServicesItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (context) => MoreDialog(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildlatesttransaction() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: BlocProvider(
              create: (context) =>
                  HistoryTransactionBloc()..add(TransactionGet()),
              child:
                  BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
                builder: (context, state) {
                  print('state');
                  print(state.toString());
                  if (state is HistoryTransactionSucces) {
                    return Column(
                      children: state.transaction.map(
                        (transaction) {
                          return HomeLatestTransactionItem(
                            transaction: transaction,
                          );
                        },
                      ).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildsendagain() {
    return Container(
      margin: EdgeInsets.only(top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imgUrl: 'assets/img_friend1.png',
                  username: 'Yuanita',
                ),
                HomeUserItem(
                  imgUrl: 'assets/img_friend2.png',
                  username: 'Jani',
                ),
                HomeUserItem(
                  imgUrl: 'assets/img_friend3.png',
                  username: 'Urip',
                ),
                HomeUserItem(
                  imgUrl: 'assets/img_friend4.png',
                  username: 'Masa',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildfriendlytips() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeTipsitem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com',
              ),
              HomeTipsitem(
                imageUrl: 'assets/img_tips2.png',
                title: 'Spot the good pie of finance model',
                url: 'https://www.instagram.com/',
              ),
              HomeTipsitem(
                imageUrl: 'assets/img_tips3.png',
                title: 'Great hack to get better advices',
                url: 'https://www.instagram.com/',
              ),
              HomeTipsitem(
                imageUrl: 'assets/img_tips4.png',
                title: 'Save more penny buy this instead',
                url: 'https://www.instagram.com/',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      actions: [
        Container(
          padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          height: 326,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: lightGreyColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do More With Us',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Wrap(
                spacing: MediaQuery.of(context).size.width * 0.13,
                runSpacing: 29,
                children: [
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_data.png',
                    title: 'Data',
                    ontap: () {
                      Navigator.pushNamed(context, '/data-provider');
                    },
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_water.png',
                    title: 'Water',
                    ontap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_stream.png',
                    title: 'Stream',
                    ontap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_movie.png',
                    title: 'Movie',
                    ontap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_food.png',
                    title: 'Food',
                    ontap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: 'assets/ic_product_travel.png',
                    title: 'Travel',
                    ontap: () {},
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
