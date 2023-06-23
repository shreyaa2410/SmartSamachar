import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class catagory_news extends StatefulWidget {
  final String catagory;
  catagory_news({required this.catagory});

  @override
  State<catagory_news> createState() => _catagory_newsState();
}

class _catagory_newsState extends State<catagory_news> {
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getCatagoryNews();
  }

  getCatagoryNews() async {
    CatagoryNews newsClass = CatagoryNews();
    await newsClass.getNews(widget.catagory);
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.newspaper,
              color: const Color.fromARGB(255, 41, 39, 39),
            ),
            Text(
              'Smart',
              style: TextStyle(
                  color: Color.fromARGB(255, 41, 39, 39),
                  fontWeight: FontWeight.w600),
            ),
            GradientText(
              'Samachar',
              style: TextStyle(fontWeight: FontWeight.w600),
              colors: [
                Color.fromARGB(255, 108, 189, 255),
                Colors.pinkAccent,
                //add mroe colors here.
              ],
            ),
          ],
        ),
        actions: <Widget>[Opacity(opacity: 0)],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )

          // catagories
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 18),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return NewsTitle(
                              imageUrl: articles[index].urlToImage.toString(),
                              title: articles[index].title,
                              descp: articles[index].description,
                              url: articles[index].articleUrl,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class NewsTitle extends StatelessWidget {
  final String imageUrl, title, descp, url;
  NewsTitle(
      {required this.imageUrl,
      required this.title,
      required this.descp,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => article_view(url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
            Text(
              descp,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
