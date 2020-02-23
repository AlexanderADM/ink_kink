import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chat_page.dart';
import '../backend/models.dart';
import 'dart:math';

class MessagePage extends StatelessWidget {
  final List<User> people;

  MessagePage({this.people});

  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Matches"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          User user = people[random.nextInt(people.length)];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(user.imagePath == null ? "assets/profile/${random.nextInt(3)}.jpg" : user.imagePath),
            ),
            title: Text(
              user.name,
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Row(
              children: <Widget>[
                Text(
                  user.description.length > 25
                      ? "${user.description.substring(0, 26)}..."
                      : user.description,
                  style: TextStyle(fontSize: 14),
                ),
                Spacer(),
                Text(
                  DateFormat("MMMM d, HH:mm").format(DateTime.now()).toString(),
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatRoom(user: user)),
              );
            },
          );
        },
        itemCount: random.nextInt(12),
      ),
      //home: new ChatScreen(),
    );
  }
}
