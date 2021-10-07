import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news_modal.dart';
import 'package:new_app/models/news_old.dart';

class PrimaryCard extends StatelessWidget {
  final NewsModal news;
  const PrimaryCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5.0,
                backgroundColor: kGrey1,
              ),
              SizedBox(width: 10.0),
              Text(
                news.category,
                style: kCategoryTitle,
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: Hero(
              tag: news.image,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(news.image), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kTitleCard,
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              CircleAvatar(
                radius: 5.0,
                backgroundColor: kGrey1,
              ),
              SizedBox(width: 4.0),
              Text(
                news.time,
                style: kDetailContent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
