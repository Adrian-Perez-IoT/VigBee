import 'package:flutter/material.dart';
import 'package:vigbee/screens/alerts/alerts_screen.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add_alert),
        color: Colors.blue,
        tooltip: 'Show alerts',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlertsScreen(),
            ),
          );
        },
      ),
      Spacer(),
      Spacer(),
      // IconButton(

      //   icon: const Icon(Icons.cloud_queue),
      //   iconSize: 30,
      //   color: Colors.blue,
      //   tooltip: 'Tiempo',
      //   onPressed: () {},
      // ),
      Spacer(),

      // IconButton(
      //   icon: const Icon(Icons.settings),
      //   color: Colors.blue,
      //   tooltip: 'Settings',
      //   onPressed: () {},
      // ),
    ],
  );
}
