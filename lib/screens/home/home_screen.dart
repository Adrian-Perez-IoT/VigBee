import 'package:flutter/material.dart';
import 'package:vigbee/components/my_bottom_navbar.dart';

import 'components/appBar.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
