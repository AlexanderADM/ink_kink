import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ink_kink/ux/message_page.dart';
import 'package:ink_kink/backend/models.dart';
import 'package:ink_kink/ux/settings_page.dart';
import '../backend/test_objects.dart';
import 'user_card.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> cardList;

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _getUserCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Ink Kink"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
          icon: Icon(Icons.settings),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(
                    people: testUsers,
                  ),
                ),
              );
            },
            icon: Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: cardList,
      ),
    );
  }

  List<Widget> _getUserCard() {
    List<UserCard> cards = new List();
    for (User user in testUsers)
      cards.add(new UserCard(
        user: user,
      ));

    List<Widget> cardList = new List();
    for (int i = 0; i < cards.length; ++i) {
      cardList.add(
        Positioned(
          top: 10,
          child: AnimatedContainer(
            duration: Duration(seconds: 10),
            curve: Curves.easeInOut,
            child: Draggable(
              axis: Axis.horizontal,
              onDragEnd: (drag) {
                _removeCard(i);
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text("Liked ${cards[i].user.name}"),
                ));
              },
              childWhenDragging: Container(),
              feedback: cards[i],
              child: cards[i],
              onDragCompleted: () {},
            ),
          ),
        ),
      );
    }
    return cardList;
  }
}
