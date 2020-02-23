import 'package:flutter/material.dart';
import 'package:ink_kink/ux/user_card.dart';
import 'package:ink_kink/backend/models.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<StatefulWidget> {
  bool _location = false;
  bool _online = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
//          for (final message in messages)
          SwitchListTile(
            title: const Text('Display your location'),
            value: _location,
            onChanged: (bool value) {
              setState(() {
                _location = value;
              });
            },
            secondary: const Icon(Icons.map),
          ),
          SwitchListTile(
            title: const Text('Show online status'),
            value: _online,
            onChanged: (bool value) {
              setState(() {
                _online = value;
              });
            },
            secondary: const Icon(Icons.add),
          ),
          ListTile(
            title: const Text('Change profile info'),
            onTap: () {
              
            },
            leading: const Icon(Icons.perm_identity),
            trailing: const Icon(Icons.settings),
          ),
          ListTile(
            title: const Text('Matching preferences'),
            onTap: () {
              
            },
            leading: const Icon(Icons.people),
            trailing: const Icon(Icons.settings),
          ),
        ],
      ),
      //home: new ChatScreen(),
    );
  }
}
