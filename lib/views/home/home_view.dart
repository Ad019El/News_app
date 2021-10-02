import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/views/home/popular_tab_view.dart';
import 'package:new_app/views/home/recent_view.dart';
import 'package:new_app/views/home/trending_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "WELCOME",
                  textAlign: TextAlign.start,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  "Tuesday 17th, 2020",
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
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  // unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Trending"),
                    Tab(text: "Business"),
                    Tab(text: "Technology"),
                    Tab(text: "Entertainment"),
                    Tab(text: "General"),
                    Tab(text: "Health"),
                    Tab(text: "Science"),
                    Tab(text: "Sports"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
