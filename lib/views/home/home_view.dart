import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/views/home/TabBarViews/entertainment_view.dart';
import 'package:new_app/views/home/TabBarViews/health_view.dart';
import 'package:new_app/views/home/TabBarViews/science_view.dart';
import 'package:new_app/views/home/TabBarViews/sport_view.dart';
import 'package:new_app/views/home/TabBarViews/technology_view.dart';
import 'package:new_app/views/home/TabBarViews/business_view.dart';
import 'package:new_app/views/home/TabBarViews/general.dart';
import 'package:new_app/widgets/appbar_ListTile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              appbar_ListTile(),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
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
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            PopularTabView(),
            BusinessTabView(),
            TechnologyTabView(),
            EntertainmentTabView(),
            HealthTabView(),
            ScienceTabView(),
            SportTabView(),
          ],
        ),
      ),
    );
  }
}
