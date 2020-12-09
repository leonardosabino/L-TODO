import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu Tasks',
              style: Theme.of(context).appBarTheme.textTheme.headline6,
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            leading: Icon(Icons.weekend),
            title: Text(
              'Unique Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.add_business),
            title: Text(
              'Daily Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.weekend),
            title: Text(
              'Weekly Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.weekend),
            title: Text(
              'Monthly Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.weekend),
            title: Text(
              'Annually Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit', style: TextStyle(fontSize: 20)),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
