import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/models/news_old.dart';
import 'package:new_app/widgets/read_news_view.dart';
import 'package:new_app/widgets/primary_card.dart';
import 'package:new_app/widgets/secondary_card.dart';
import 'package:new_app/buttomnav.dart';
import 'package:new_app/widgets/shimmer/shimmer_card.dart';
import 'package:new_app/widgets/shimmer/shimmer_loading.dart';

class PopularTabView extends StatefulWidget {
  const PopularTabView({Key? key}) : super(key: key);

  @override
  State<PopularTabView> createState() => _PopularTabViewState();
}

class _PopularTabViewState extends State<PopularTabView> {
  @override
  Widget build(BuildContext context) {
    getNews() async {
      await getPopularListNews();
      setState(() {
        isloading = false;
      });
    }

    getNews();

    // print(isloading);
    return isloading
        ? Shimmer_loading_general_view()
        : ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                child: ListView.builder(
                    itemCount: generalNews.length,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var news = generalNews[index];

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
                    "Based in your search history!",
                    style: kNonActiveTabStyle,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: entertainmentNews.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
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
                        margin: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        child: SecondaryCard(news: news),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
