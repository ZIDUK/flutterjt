import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../screen2/gathering.dart';

class Screen2 extends StatefulWidget {
  Screen2State createState() => new Screen2State();
}

class Screen2State extends State<Screen2> {
  List data;

  Future<String> getDataJT() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "succes!";
  }

  void initState() {
    this.getDataJT();
  }

  @override
  Widget build(BuildContext context) {
    // Future<Post> post = FetchPost().fetchPost();

    // print(post.toString());

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}
