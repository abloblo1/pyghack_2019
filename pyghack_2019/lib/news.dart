import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Post> fetchPost() async {
  String url = "https://newsapi.org/v2/top-headlines?" + 'country=us&' +
      'apiKey=2c67b49b8e2044a18751f3b8be4d5315';

  final response =
      await http.get(url);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
class Post {
  String status;
  int totalResults;
  List<Articles> articles;

  Post({this.status, this.totalResults, this.articles});

  Post.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class News extends StatefulWidget {
  final Future<Post> post;

  News({Key key, this.post}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _News();
  }
}

class _News extends State<News> {
  Future<Post> post;
  List<Color> themeColors = new List();
  List<Widget> widgets = new List();
  List<String> titles = new List();

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext build) {
    themeColors.add(const Color(0xFFCE0009));
    themeColors.add(const Color(0xFFD14248));
    themeColors.add(const Color(0xFFD66E71));
    themeColors.add(const Color(0xFFF28F94));
    themeColors.add(const Color(0xFFE3AFB1));
    //Color base = const Color(0xFFCE0009);
    return MaterialApp(
      title: 'Trending Topics to Consider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trending Topics to Consider'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Articles> top5 = snapshot.data.articles;
                for (int i = 0; i < top5.length; i++) {
                  String currTitle = top5[i].title;
                  // trying to get rid of the " - New York Times" at end of title, but not working rn
                  List<String> split = currTitle.split(' - ');
                  titles.add(split[0]);
                }
                var toReturn = new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                        child: new Text (
                            titles[0],
                            style: new TextStyle(
                                color: Colors.black,
                            )
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: themeColors[0]
                        ),
                        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                        child: new Text (
                            titles[1],
                            style: new TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: themeColors[1]
                        ),
                        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                        child: new Text (
                            titles[2],
                            style: new TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: themeColors[2]
                        ),
                        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                        child: new Text (
                            titles[3],
                            style: new TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: themeColors[3]
                        ),
                        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                        child: new Text (
                            titles[4],
                            style: new TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                            color: themeColors[4]
                        ),
                        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      ),
                    ]
                );
                return toReturn;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        )
      ),
    );
  }
}
