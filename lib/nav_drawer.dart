import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'custom_layout.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/cover.jpg')
              // )
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home page'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatScreen();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const Text('Custom layout'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Screen2();
              }));
            },
          ),
        ],
      ),
    );
  }
}