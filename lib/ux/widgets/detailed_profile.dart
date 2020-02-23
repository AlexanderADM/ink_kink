import 'package:flutter/material.dart';
import 'package:ink_kink/backend/models.dart';

import '../chat_page.dart';

class DetailedProfile extends StatefulWidget {
  final User user;
  DetailedProfile({this.user});
  @override
  _DetailedProfileState createState() => _DetailedProfileState(user: user);
}

class _DetailedProfileState extends State<DetailedProfile> {
  final User user;
  _DetailedProfileState({this.user});

  var currentDate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "${user.name}, ${user.calculateAge()}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.all(20),
            subtitle: Text(
              "${user.description}",
              style: TextStyle(fontSize: 22),
            ),
            trailing: IconButton(
              icon: Icon(Icons.chat_bubble),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatRoom(user: user)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
