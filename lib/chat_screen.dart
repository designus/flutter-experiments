import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat/chat_message.dart';
import 'package:friendly_chat/skeleton.dart';
import 'package:provider/provider.dart';
import 'package:friendly_chat/models/chat_screen_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  _handleSubmitted(String text) {
    var chatScreen = context.read<ChatScreenModel>();

    if (!_isComposing) return null;

    _textController.clear();

    setState(() {
      _isComposing = false;
    });

    var message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this
      ),
    );

    // Provider.of<ChatScreenModel>(context, listen: false).addMessage(message);
    chatScreen.addMessage(message);

    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: (
              TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() => {
                    _isComposing = text.isNotEmpty
                  });
                },
                onSubmitted: (String text) {
                  _handleSubmitted(text);
                },
                focusNode: _focusNode,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message'
                )
              )
            ),
          ),
          IconTheme(
            data: IconThemeData(
              color: _isComposing ? Theme.of(context).colorScheme.secondary : Theme.of(context).disabledColor
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Theme.of(context).platform == TargetPlatform.iOS 
                ? CupertinoButton(
                    child: const Text('Send'),
                    onPressed: () {
                      _handleSubmitted(_textController.text);
                    },
                  ) 
                : IconButton(
                    icon: const Icon(Icons.send),
                     onPressed: () {
                      _handleSubmitted(_textController.text);
                    },
                  )
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      title: 'Chat page',
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Consumer<ChatScreenModel>(
                builder: (context, chatScreen, child) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, index) => chatScreen.messages[index],
                    itemCount: chatScreen.messagesCount
                  );
                },
              )
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(context)
            )
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
          ? BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
              ),
            )
          : null,
      )
    );
  }
}
