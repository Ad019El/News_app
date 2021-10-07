import 'package:flutter/material.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/models/news_old.dart';
import 'package:new_app/widgets/read_news_view.dart';
import 'package:new_app/widgets/secondary_card.dart';
import 'package:new_app/widgets/shimmer/shimmer_loading.dart';

class EntertainmentTabView extends StatelessWidget {
  const EntertainmentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entertainmentNews.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var news = entertainmentNews[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadNewsView(news: news),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 135.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: SecondaryCard(news: news),
          ),
        );
      },
    );
  }
}
