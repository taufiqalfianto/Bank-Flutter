import 'package:bank/ui/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatButton(),
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text('Statistc Page'),
      ),
    );
  }
}
