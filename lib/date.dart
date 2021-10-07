import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var today = DateFormat.MMMMEEEEd().format(DateTime.now());

getRelativeDate(newsTime) {
  var now = DateTime.now();
  var newsDate = DateTime.parse(newsTime);
  var diff = now.difference(newsDate);
  var date = new DateTime.now().subtract(new Duration(minutes: diff.inMinutes));
  return timeago.format(date, locale: 'en_short');
}
// class RelativeTime extends StatelessWidget {
//   const RelativeTime({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var now = DateTime.now();
//     var newsDate = DateTime.parse("2021-10-06T00:00:00Z");
//     var diff = now.difference(newsDate);
//     var date = new DateTime.now().subtract(new Duration(minutes: diff.inMinutes));
//     var relativeDate = timeago.format(date, locale: 'en_short');
//     return Container(
      
//     );
//   }
// }