import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=Your API KEY");

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),

            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

// class NewsCountry {
//   List<ArticleModel> news = [];
//   Future<void> getNews(String value) async {
//     var url = Uri.parse(
//         "https://newsapi.org/v2/top-headlines?country=$value&category=business&apiKey=Your API KEY");

//     http.Response response = await http.get(url);
//     var jsonData = jsonDecode(response.body);
//     if (jsonData['status'] == "ok") {
//       jsonData["articles"].forEach((element) {
//         if (element['urlToImage'] != null && element['description'] != null) {
//           ArticleModel article = ArticleModel(
//             title: element['title'],
//             description: element['description'],
//             urlToImage: element['urlToImage'],
//             // publshedAt: DateTime.parse(element['publishedAt']),

//             articleUrl: element["url"],
//           );
//           news.add(article);
//         }
//       });
//     }
//   }
// }

class CatagoryNews {
  List<ArticleModel> news = [];
  Future<void> getNews(String Catagory) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$Catagory&apiKey=Your API KEY");

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),

            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
