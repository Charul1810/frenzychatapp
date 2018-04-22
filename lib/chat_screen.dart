import 'package:flutter/material.dart';
import 'package:flutterchatapp/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handlesubmitted(String text){
    _textController.clear();

    ChatMessage message = new ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }


  Widget _textComposer(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
              controller: _textController,
              onSubmitted: _handlesubmitted,
              decoration: new InputDecoration.collapsed(
                  hintText: "Send a Message"),
            ),),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handlesubmitted(_textController.text)),
            )
          ],
        )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
      return new Column(
        children: <Widget>[
          new Flexible(
              child: new ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_,int index) => _messages[index],
                itemCount: _messages.length,)
          ),
          new Divider(height: 1.0,),
          new Container(
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor
            ),
            child: _textComposer(),
          )
        ],
      );
  }
}
