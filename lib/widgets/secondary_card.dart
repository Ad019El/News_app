import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';
import 'package:new_app/models/news_modal.dart';
import 'package:new_app/models/news_old.dart';

class SecondaryCard extends StatelessWidget {
  final NewsModal news;
  const SecondaryCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3, width: 1),
      ),
      child: Row(
        children: [
          Hero(
            tag: news.image,
            child: Container(
              height: 135.0,
              width: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage(news.image), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey1,
                      ),
                      SizedBox(width: 1.0),
                      Text(
                        news.time,
                        style: kDetailContent,
                      ),
                      // SizedBox(width: 4.0),
                      // SizedBox(
                      //   width: 10.0,
                      //   child: Divider(
                      //     color: kBlack,
                      //     height: 1.0,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
