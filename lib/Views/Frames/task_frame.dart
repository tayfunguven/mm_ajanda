import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TaskFrame extends StatefulWidget {
  const TaskFrame({Key? key}) : super(key: key);

  @override
  _TaskFrameState createState() => _TaskFrameState();
}

class _TaskFrameState extends State<TaskFrame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.basic,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('Timeline Event $index'),
                ),
                itemCount: 10,
              ),
            ),
          )
        ],
      )
    );
  }
}
