import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:friendly_chat/models/chat_screen_model.dart';

void main() {
  runApp(
    const FriendlyChatApp(),
  );
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
);

final ThemeData kDefaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
      .copyWith(secondary: Colors.orangeAccent[400]),
);

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatScreenModel(),
      child: MaterialApp(
        title: 'FriendlyChat2',
        theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
        home: const ChatScreen(),
      ),
    );
  }
}

