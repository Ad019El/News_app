class NewsModal {
  final String sourceName; // var = author in my app
  final String title;
  final String description; // var  = content in my app
  final String image;
  final String url;
  final String time;
  final String category;

  NewsModal(
      {required this.description,
      required this.title,
      required this.image,
      required this.sourceName,
      required this.time,
      required this.url,
      required this.category});
}
