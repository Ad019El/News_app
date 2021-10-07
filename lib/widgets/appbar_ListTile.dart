import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/date.dart';

class appbar_ListTile extends StatelessWidget {
  const appbar_ListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "WELCOME",
        textAlign: TextAlign.start,
        style: kActiveTabStyle.copyWith(fontSize: 14, color: kGrey1),
      ),
      subtitle: Text(
        today,
        textAlign: TextAlign.start,
        style: kActiveTabStyle,
      ),
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage("assets/Apple_News_app_blk.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
