import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news_modal.dart';
import 'package:new_app/models/news_old.dart';
import 'package:new_app/widgets/cyrcle_buttom.dart';
import 'package:new_app/widgets/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadNewsView extends StatelessWidget {
  final NewsModal news;
  ReadNewsView({required this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => {Navigator.pop(context)},
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 12.0),
            Hero(
              tag: news.image,
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey3,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        news.category,
                        style: kCategoryTitle,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        color: kGrey2,
                      ),
                      SizedBox(width: 5),
                      Text(
                        news.time,
                        style: TextStyle(
                          color: kGrey1,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15.0),
              ],
            ),
            SizedBox(height: 12.0),
            Text(news.title, style: kTitleCard.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(news.time, style: kDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: kBlack,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  news.sourceName,
                  style: kDetailContent.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              news.description,
              style: descriptionStyle,
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(
                        width: 2,
                        color: kBlack,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: news.url),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Text(
                        'Read more...',
                        style: kTitleCard,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Status extends StatelessWidget {
//   final IconData icon;
//   final String total;
//   Status({required this.icon, required this.total});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, color: kGrey2),
//         SizedBox(width: 4.0),
//         Text(total, style: kDetailContent),
//       ],
//     );
//   }
// }
