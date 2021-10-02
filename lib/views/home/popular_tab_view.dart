import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/views/home/read_news_view.dart';
import 'package:new_app/widgets/primary_card.dart';
import 'package:new_app/widgets/secondary_card.dart';

class PopularTabView extends StatelessWidget {
  const PopularTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: ListView.builder(
                itemCount: popularList.length,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var news = popularList[index];
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
                      margin: EdgeInsets.only(right: 6.0, left: 10.0),
                      child: PrimaryCard(news: news),
                    ),
                  );
                }),
          ),
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text(
                "Baesd in your search history!",
                style: kNonActiveTabStyle,
              ),
            ),
          ),
          ListView.builder(
              itemCount: recentList.length,
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // physics: const BouncingScrollPhysics(
              //     parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: (context, int index) {
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
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                    child: SecondaryCard(news: recent),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
