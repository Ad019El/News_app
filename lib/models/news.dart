import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/date.dart';
import 'package:new_app/models/news_modal.dart';

bool isloading = true;
bool isLoadingSearch = true;

var randomItem = (list..shuffle()).first;
var query = "";

var description = "";
var title = "";
var image = "";
var time = "";
var sourceName = "";
var url = "";

var list = [
  'technology',
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
];

List<NewsModal> searchedNews = [];
List<NewsModal> technologyNews = [];
List<NewsModal> businessNews = [];
List<NewsModal> entertainmentNews = [];
List<NewsModal> generalNews = [];
List<NewsModal> healthNews = [];
List<NewsModal> scienceNews = [];
List<NewsModal> sportsNews = [];
/*
api keys: 
af15c3b97a124fdfbaea774ee653f08a
539f7357fa464660994872fbb46b53ff
2b3933d47b8b4173b9f8def66668b1ee
97762d76a4114b96bb6b06547f0a520b
906a338308a646b7ab1acfccefe4df71 // used
*/
var key = "906a338308a646b7ab1acfccefe4df71";

Future<void> getSearchNews() async {
  String searchURL =
      "https://newsapi.org/v2/everything?q=${query}&sortBy=popularity&language=en&apiKey=${key}";
  var searchResponse = await http.get(Uri.parse(searchURL));
  var searchJsonData;

  searchJsonData = jsonDecode(searchResponse.body);

  searchJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[0]);
      searchedNews.add(popularModal);
    }
  });
}

Future<void> getPopularListNews() async {
  String techURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[0]}&language=en&apiKey=${key}";
  String businessURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[1]}&language=en&apiKey=${key}";
  String entretaitmentURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[2]}&language=en&apiKey=${key}";
  String generalURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[3]}&language=en&apiKey=${key}";
  String healthURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[4]}&language=en&apiKey=${key}";
  String scienURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[5]}&language=en&apiKey=${key}";
  String sportURL =
      "https://newsapi.org/v2/top-headlines?everything&category=${list[6]}&language=en&apiKey=${key}";

  var techResponse = await http.get(Uri.parse(techURL));
  var businResponse = await http.get(Uri.parse(businessURL));
  var entreResponse = await http.get(Uri.parse(entretaitmentURL));
  var generResponse = await http.get(Uri.parse(generalURL));
  var healtResponse = await http.get(Uri.parse(healthURL));
  var scienResponse = await http.get(Uri.parse(scienURL));
  var sporResponse = await http.get(Uri.parse(sportURL));

  var techJsonData;
  var businJsonData;
  var entreJsonData;
  var generJsonData;
  var healtJsonData;
  var scienJsonData;
  var sporJsonData;

  // ---------------------------------------------
  techJsonData = jsonDecode(techResponse.body);
  businJsonData = jsonDecode(businResponse.body);
  entreJsonData = jsonDecode(entreResponse.body);
  generJsonData = jsonDecode(generResponse.body);
  healtJsonData = jsonDecode(healtResponse.body);
  scienJsonData = jsonDecode(scienResponse.body);
  sporJsonData = jsonDecode(sporResponse.body);

  techJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[0]);
      technologyNews.add(popularModal);
    }
  });
  businJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[1]);
      businessNews.add(popularModal);
    }
  });
  entreJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[2]);
      entertainmentNews.add(popularModal);
    }
  });
  generJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[3]);
      generalNews.add(popularModal);
    }
  });
  healtJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[4]);
      healthNews.add(popularModal);
    }
  });
  scienJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[5]);
      scienceNews.add(popularModal);
    }
  });
  sporJsonData["articles"].forEach((element) {
    if (element["description"] != null &&
        element["urlToImage"] != null &&
        element["content"] != null &&
        element["publishedAt"] != null &&
        element["source"]["name"] != null) {
      /// begin if
      sourceName = element["source"]["name"];
      description = element["content"];
      title = element["title"];
      image = element["urlToImage"];
      time = element["publishedAt"];
      url = element["url"];
      NewsModal popularModal = NewsModal(
          description: description,
          image: image,
          sourceName: sourceName,
          time: getRelativeDate(time),
          title: title,
          url: url,
          category: list[6]);
      sportsNews.add(popularModal);
    }
  });
}
