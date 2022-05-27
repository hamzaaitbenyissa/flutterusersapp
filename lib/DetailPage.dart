import 'package:ex2/User.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: SafeArea(
            child: Column(children: [
          Container(
            child: Container(
              width: double.infinity,
              height: 150,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(user.profail),
                  radius: 60.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            user.name + " " + user.lastname,
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.city +"," + user.country,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              elevation: 2.0,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                        letterSpacing: 2.0, fontWeight: FontWeight.w300),
                  ))),
          SizedBox(
            height: 15,
          ),
          Text(
            user.phone,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),
                    SizedBox(
            height: 15,
          ),
          Text(
            user.email,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300),
          ),

        ])));
  }
}
