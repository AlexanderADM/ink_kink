import 'package:flutter/material.dart';
import '../backend/models.dart';
import 'dart:math';

class ChatRoom extends StatelessWidget {

  final User user;
  ChatRoom({@required this.user});

  User getUser(){
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ChatScreen(user),
    );
  }
}

class ChatScreen extends StatefulWidget {
  User user;
  ChatScreen(this.user);
  @override //new
  State createState() => new ChatScreenState(user);
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController =
      new TextEditingController(); //new
  bool _isComposing = false;
  User user;
  ChatScreenState(this.user);

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          //new
          children: <Widget>[
            //new
            new Flexible(
              //new
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  //new
                  setState(() {
                    //new
                    _isComposing = text.length > 0; //new
                  }); //new
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              //new
              margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
              child: new IconButton(
                //new
                icon: new Icon(Icons.send), //new
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text) //modified
                    : null,
              ), //new
            ),
          ],
        ),
      ),
    );
  } //new

  @override
  void dispose() {
    //new
    for (ChatMessage message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose(); //new
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      //new
      _isComposing = false; //new
    }); //new
    ChatMessage message = new ChatMessage(
      //new
      text: text, //new
      animationController: new AnimationController(
        //new
        duration: new Duration(milliseconds: 700), //new
        vsync: this, //new
      ), //new
    ); //new
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override //new
  Widget build(BuildContext context) {
    Random random = new Random();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${user.name}"),
        actions: <Widget>[
          new CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(user.imagePath == null ? "assets/profile/${random.nextInt(3)}.jpg" : user.imagePath),
          ),
        ],
        centerTitle: true,
      ),
      body: new Column(
        //modified
        children: <Widget>[
          //new
          new Flexible(
            //new
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0), //new
              reverse: true, //new
              itemBuilder: (_, int index) => _messages[index], //new
              itemCount: _messages.length, //new
            ), //new
          ), //new
          new Divider(height: 1.0), //new
          new Container(
            //new
            //new
            child: _buildTextComposer(), //modified
          ), //new
        ], //new
      ), //new
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController}); //modified
  final String text;
  final AnimationController animationController;
  //counter++;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      //new
      sizeFactor: new CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut), //new
      axisAlignment: 0.0, //new

      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: new CircleAvatar(
                      backgroundImage: AssetImage("assets/background.jpg"),
                    ),
                  ),

                 new Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),

//            new Expanded(
//                child: new Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    // new Text(_name, style: Theme.of(context).textTheme.subhead),
//                    new Container(
//                      margin: const EdgeInsets.only(left: 16.0),
//                      child: new CircleAvatar(
//                        backgroundImage:
//                        AssetImage("assets/profile/0.jpg"),
//                      ),
//                    ),
//
//                    new Container(
//                      margin: const EdgeInsets.only(right: 5.0),
//                      child: new Text("Hey, nice tattoo !"),
//                    ),
//                  ],
//                )),


          ],
        ),
      ),
    );
  }
}
