import 'package:flutter/material.dart';
import 'package:vigbee/screens/home/components/status_with_update_btn.dart';

import '../../../constants.dart';
import 'header_with_weatherbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithWeatherBox(size: size),
          HouseStatusRead(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
