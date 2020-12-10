import 'package:flutter/material.dart';
import '../../../constants.dart';

class HeaderWithWeatherBox extends StatelessWidget {
  const HeaderWithWeatherBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.25,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 100 + kDefaultPadding,
            ),
            height: size.height * 0.30 - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/backgroundHeader.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
