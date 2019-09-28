import 'dart:async';
import 'dart:convert';
import 'user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

List<Color> themeColors = new List();
List<String> titles = new List();
int entryCounter = 0;

Future<Post> fetchPost() async {
  String url = "https://newsapi.org/v2/top-headlines?" + 'sources=bbc-news&' +
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

//class HomeMaterial extends StatefulWidget {
//  @override
//  _HomeMaterialState createState() => _HomeMaterialState();
//}
//
//class _HomeMaterialState extends State<HomeMaterial> {
//  final _formKey = GlobalKey<FormState>();
//  final _user = User();
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Profile')),
//      body: Container(
//        padding:
//          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//          child: Builder(
//            builder: (context) => Form(
//              key: _formKey,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: [
//                  TextFormField(
//                    decoration:
//                    InputDecoration(labelText: 'First name'),
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Please enter your first name';
//                      }
//                    },
//                    onSaved: (val) =>
//                      setState(() => _user.firstName = val),
//                  ),
//                  TextFormField(
//                    decoration:
//                    InputDecoration(labelText: 'Last name'),
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter your last name.';
//                        }
//                      },
//                      onSaved: (val) =>
//                          setState(() => _user.lastName = val)
//                  ),
//                  Container(
//                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                    child: Text('Subscribe'),
//                  ),
//                  SwitchListTile(
//                    title: const Text('Monthly Newsletter'),
//                    value: _user.newsletter,
//                    onChanged: (bool val) =>
//                      setState(() => _user.newsletter = val)
//                  ),
//                  Container(
//                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
//                    child: Text('Interests'),
//                  ),
//                  CheckboxListTile(
//                    title: const Text('Cooking'),
//                    value: _user.passions[User.PassionCooking],
//                    onChanged: (val) {
//                      setState(() =>
//                      _user.passions[User.PassionCooking] = val);
//                    }
//                  ),
//                  CheckboxListTile(
//                    title: const Text('Traveling'),
//                    value: _user.passions[User.PassionTraveling],
//                    onChanged: (val) {
//                      setState(() =>
//                      _user.passions[User.PassionTraveling] = val);
//                    }
//                  ),
//                  CheckboxListTile(
//                    title: const Text('Hiking'),
//                    value: _user.passions[User.PassionHiking],
//                    onChanged: (val) {
//                      setState(() =>
//                      _user.passions[User.PassionHiking] = val);
//                    }
//                  ),
//                  Container(
//                    padding: const EdgeInsets.symmetric(
//                      vertical: 16.0, horizontal: 16.0
//                    ),
//                    child: RaisedButton(
//                      onPressed: () {
//                        final form = _formKey.currentState;
//                        if (form.validate()) {
//                          form.save();
//                          _user.save();
//                          _showDialog(context);
//                        }
//                      },
//                      child: Text('Save'))
//                  ),
//                ])))));
//  }
//  _showDialog(BuildContext context) {
//    Scaffold.of(context)
//        .showSnackBar(SnackBar(content: Text('Submitting form')));
//  }
//}

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
    Color backgroundColor = const Color(0xFFE7E8E9);

    final _formKey = GlobalKey<FormState>();
    final _user = User();

    Widget createNewsBanner(int index) {
      Widget toReturn = new Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
        child:
        new Text (
            titles[index],
            style: new TextStyle(
              color: Colors.black,
            )
        ),
        decoration: new BoxDecoration (
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: themeColors[index]
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      );

      return toReturn;
    }

    Widget createFormFields(String title) {
      String inputValue = "";
      if (title == "Movie Name: ") {
        inputValue = _user.movieName;
      } else if (title == "Topics Interested In: ") {
        inputValue = _user.topicsInterested;
      } else if (title == "Additional Comments: ") {
        inputValue = _user.additionalComments;
      }

      Widget toReturn = new Column(
        children: <Widget>[
          Container(
            child: Text(title, textAlign: TextAlign.left),
            padding: EdgeInsets.all(10.0),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              ),
              child: TextFormField(
                onSaved: (val) => setState(() => inputValue = val),
              )
          )
        ],
      );
      return toReturn;
    }

    _showDialog(BuildContext context) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Submitting form')));
    }

    return MaterialApp(
      title: 'Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "REQUEST",
                    style: TextStyle(
                        fontSize: 32
                    )
                ),
              ),

              Container(
                width: 350,
                padding: EdgeInsets.all(8.0),
                child: Text("Request certain movies you want to see. If you don’t have a specific movie title, feel free to request a topic of interest. Gain inspiration from the list of currently trending issues below.",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 12
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Builder(
                  builder: (context) => Form(
                  key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  createFormFields("Movie Name: "),
                  createFormFields("Topics Interested In: "),
                  createFormFields("Additional Comments: "),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 0.0
                    ),
                    child: RaisedButton(
                      padding: const EdgeInsets.all(0.0),
                      textColor: themeColors[0],
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          _user.save();
                          _showDialog(context);
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: Text('Submit')
                    )
                ),
              ])))),

              Text(
                "Current Topics to Consider",
                style: TextStyle(
                  fontSize: 20
                )
              ),

              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Articles> top5 = snapshot.data.articles;
                    for (int i = 0; i < top5.length; i++) {
                      String currTitle = top5[i].title;
                      titles.add(currTitle);
                    }
                    var toReturn = new Column(
                        children: <Widget>[
                          createNewsBanner(0),
                          createNewsBanner(1),
                          createNewsBanner(2),
                          createNewsBanner(3),
                          createNewsBanner(4),
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
              Container(
                padding: EdgeInsets.all(20.0),
              )
            ],
          )
        ),
      ),
    );
  }
}
