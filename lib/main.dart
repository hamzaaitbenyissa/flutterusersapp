import 'dart:convert';
import 'package:ex2/DetailPage.dart';
import 'package:ex2/User.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    var data =
        await http.get(Uri.https('randomuser.me', 'api', {'results': '10'}));
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData["results"]) {
      User user = User(u["name"]["first"],u["name"]["last"],u["email"],u["picture"]["large"],u["location"]["city"],u["location"]["country"],u["phone"]);
      users.add(user);
    }

    print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                          child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data[index].profail),
                        ),
                        title: Text(snapshot.data[index].name + " " + snapshot.data[index].lastname ),
                        subtitle: Text(snapshot.data[index].email),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                      )
                      );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
