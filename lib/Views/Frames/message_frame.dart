import 'package:flutter/material.dart';
import 'package:mm_ajanda/Models/chat_user_model.dart';
import 'package:mm_ajanda/Views/Frames/message_dialog_frame.dart';
import 'package:mm_ajanda/widgets/conversation_list.dart';

class MessageFrame extends StatefulWidget {
  const MessageFrame({Key? key}) : super(key: key);

  @override
  _MessageFrameState createState() => _MessageFrameState();
}

class _MessageFrameState extends State<MessageFrame> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "https://picsum.photos/200/300", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "https://picsum.photos/200/200", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "https://picsum.photos/200/100", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "https://picsum.photos/100/300", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "https://picsum.photos/250/300", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "https://picsum.photos/200/350", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "https://picsum.photos/210/310", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "https://picsum.photos/200/320", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return ConversationList(
                          name: chatUsers[index].name,
                          messageText: chatUsers[index].messageText,
                          imageUrl: chatUsers[index].imageURL,
                          time: chatUsers[index].time,
                          isMessageRead: (index == 0 || index == 3)?true:false,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

