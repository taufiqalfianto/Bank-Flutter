import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int _currentindex = 0;

    _ontap(_index) {
      switch (_index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/history');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/statistics');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/rewards');
          break;
      }
      setState(() {
        _currentindex = _index;
      });
    }

    return BottomAppBar(
      color: whiteColor,
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 12,
      elevation: 0,
      child: BottomNavigationBar(
        onTap: _ontap,
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: whiteColor,
        selectedItemColor: blackColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: blueTextStyle.copyWith(
          fontSize: 12,
          fontWeight: medium,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontSize: 12,
          fontWeight: medium,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_overview.png',
              width: 20,
            ),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_history.png',
              width: 20,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_statistic.png',
              width: 20,
            ),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_reward.png',
              width: 20,
            ),
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}

class FloatButton extends StatelessWidget {
  const FloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: purpleColor,
      onPressed: () {},
      child: Image.asset(
        'assets/ic_plus_circle.png',
        width: 24,
      ),
    );
  }
}
