import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../ui/constants.dart';

class HeaderWithSearchBox extends StatefulWidget {
  final User user;

  const HeaderWithSearchBox({Key key, this.user}) : super(key: key);
  @override
  _HeaderWithSearchBoxState createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 1.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Hey ' + widget.user.displayName + ', Welcome!',
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 25,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Text(
                  "QuiAce",
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color: kTextColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
