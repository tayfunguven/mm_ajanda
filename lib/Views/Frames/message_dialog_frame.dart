import 'package:flutter/material.dart';

class MessageDialogFrame extends StatefulWidget {
  const MessageDialogFrame({Key? key}) : super(key: key);

  @override
  _MessageDialogFrameState createState() => _MessageDialogFrameState();
}

class _MessageDialogFrameState extends State<MessageDialogFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Detail')
      ),
      body: Container(),
    );
  }
}
