import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameEditController = new TextEditingController();
  final TextEditingController emailEditController = new TextEditingController();
  final TextEditingController passwordEditController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InkKink registration"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage("assets/Icons/empty_needle.png"),
            ),
          ),
          Column(
            children: <Widget>[
              TextField(
                onTap: () {},
                controller: nameEditController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              //TODO DatePicker
              TextField(
                onTap: () {},
                controller: emailEditController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                onTap: () {},
                controller: passwordEditController,
                decoration: InputDecoration(labelText: "Password"),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text("Done"),
                textTheme: ButtonTextTheme.primary,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Done"),
                heroTag: null,
                icon: Icon(Icons.beenhere),
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Cancel"),
                heroTag: null,
                icon: Icon(Icons.cancel),
              ),
            ],
          )
        ],
      ),
    );
  }
}
