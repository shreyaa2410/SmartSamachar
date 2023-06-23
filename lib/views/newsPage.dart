import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/catagory_model.dart';
import 'package:news_app/views/LoginScreen.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/catagory_news.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:news_app/helper/data.dart';

class newsPage extends StatefulWidget {
  const newsPage({super.key});

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  List<CatagoryModel> catagories = List<CatagoryModel>.empty(growable: true);
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  bool loading = true;
  @override
  void initState() {
    super.initState();
    catagories = getCatagories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              icon: Icon(Icons.settings),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.grey[800],
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(color: Colors.grey[800]),
                          )
                        ],
                      )),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print('selected logout');
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              }),
        ],
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
                        height: 70,
                        child: ListView.builder(
                          itemCount: catagories.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CatagoryTile(
                              imageUrl: catagories[index].imageUrl,
                              catagoryName: catagories[index].catagoryName,
                            );
                          },
                        ),
                      ),

                      // articles
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
                  )),
            ),
    );
  }
}

class CatagoryTile extends StatelessWidget {
  final String imageUrl, catagoryName;
  CatagoryTile({required this.imageUrl, required this.catagoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => catagory_news(
                      catagory: catagoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                catagoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            )
          ],
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
