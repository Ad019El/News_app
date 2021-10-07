import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/widgets/appbar_ListTile.dart';
import 'package:new_app/widgets/read_news_view.dart';
import 'package:new_app/widgets/secondary_card.dart';
import 'package:new_app/widgets/shimmer/shimmer_loading.dart';

// import 'package:english';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    getNews() async {
      if (searchedNews.length != 0) {
        setState(() {
          isLoadingSearch = true;
        });
        searchedNews.clear();
        await getSearchNews();
        setState(() {
          isLoadingSearch = false;
        });
      } else {
        await getSearchNews();
        setState(() {
          isLoadingSearch = false;
        });
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Column(children: [
          appbar_ListTile(),
        ]),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: false,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(
                                "Discover",
                                style: kBigTitleStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "News from all over the world",
                                style: kSubTitleStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                                color: kGrey3,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            margin: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 15.0),
                            child: Center(
                              child: TextField(
                                textInputAction: TextInputAction.go,
                                onChanged: (text) {
                                  query = text;
                                },
                                decoration: InputDecoration.collapsed(
                                    hintText: "Search ",
                                    hintStyle:
                                        TextStyle(color: kGrey1, fontSize: 18)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          //  change the size of the borer radius value
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: BorderSide(
                                width: 2,
                                color: kGrey1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.search),
                            ),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                query;
                              });
                              getNews();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                query == ""
                    ? Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("Enter a query",
                              style: TextStyle(fontSize: 25.0, color: kGrey1)),
                        ),
                      )
                    : isLoadingSearch
                        ? Shimmer_loaging_secondary_card()
                        // Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: searchedNews.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, int index) {
                              var recent = searchedNews[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ReadNewsView(news: recent),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 140.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 18.0),
                                  child: SecondaryCard(news: recent),
                                ),
                              );
                            }),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }
}
