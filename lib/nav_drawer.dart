import 'package:flutter/material.dart';
import 'package:friendly_chat/models/chat_screen_model.dart';
import 'package:friendly_chat/simple_layout.dart';
import 'package:provider/provider.dart';
import 'chat_screen.dart';
import 'custom_layout.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

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
          Consumer<ChatScreenModel>(
            builder: ((context, value, child) {
              return ListTile(
                leading: const Icon(Icons.chat),
                title: Row(
                  children: [
                    const Text('Chat screen'),
                    const SizedBox(width: 5),
                    Text('(${value.messagesCount.toString()})')
                  ],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChatScreen();
                  }));
                },
              );
            }),
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
          ListTile(
            leading: const Icon(Icons.add_chart_rounded),
            title: const Text('Simple layout'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SimpleLayout();
              }));
            },
          ),
        ],
      ),
    );
  }
}