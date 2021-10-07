import 'package:flutter/material.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/models/news_old.dart';
import 'package:new_app/widgets/read_news_view.dart';
import 'package:new_app/widgets/primary_card.dart';

class TechnologyTabView extends StatelessWidget {
  const TechnologyTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: technologyNews.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var trending = technologyNews[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadNewsView(news: trending),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 300.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: PrimaryCard(news: trending),
          ),
        );
      },
    );
  }
}
