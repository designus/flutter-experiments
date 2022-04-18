import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:friendly_chat/chat_message.dart';

class ChatScreenModel extends ChangeNotifier {
  final List<ChatMessage> _messages = [];

  UnmodifiableListView<ChatMessage> get messages => UnmodifiableListView(_messages);

  int get messagesCount => _messages.length;

  @override
  void dispose() {
    for (var message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }

  void addMessage(ChatMessage message) {
    _messages.insert(0, message);
    notifyListeners();
  }
}