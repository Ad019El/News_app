import 'package:flutter/material.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/views/home/read_news_view.dart';
import 'package:new_app/widgets/secondary_card.dart';

class RecentTabView extends StatelessWidget {
  const RecentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentList.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var recent = recentList[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadNewsView(news: recent),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 135.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: SecondaryCard(news: recent),
          ),
        );
      },
    );
  }
}
