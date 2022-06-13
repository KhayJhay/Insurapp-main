import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:intl/intl.dart';

class Chats_Page extends StatefulWidget {
  const Chats_Page({Key? key}) : super(key: key);

  @override
  State<Chats_Page> createState() => _Chats_PageState();
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

class _Chats_PageState extends State<Chats_Page> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECEFF0),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop;
            },
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.black,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFE8F3F3),
                  child: Icon(CupertinoIcons.person_3)),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Support",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Medium',
                        color: Color(0xFF303F46),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: GroupedListView<Message,DateTime>(
                  padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              elements: messages,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              groupBy:(message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Color(0xFF44A8E0),
                    child: Padding(padding: EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                    ),),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => BubbleSpecialOne(text: message.text, textStyle: TextStyle( color: Colors.white, fontSize: 20), color: Color(0xFFA7CD3A),),
                 /* Align(
                alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerRight,
                child:Card(
                  elevation: 8,
                  child: Padding(padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              )*/
            )),
            Container(
              color: Colors.grey.shade300,
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Write a message",
                ),
                onSubmitted: (text){
                  final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSentByMe: true,
                  );
                  setState(() => messages.add(message));
                },
              ),
            )
          ],
        )
        /*
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.25,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Hi, Please I have a severe headache, please can you prescribe a drug for me",
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "8:30",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Good afternoon, please I want to know if we having long vacation after this semester...?",
                                                textAlign: TextAlign.justify,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "6:20",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Hi, Please I have a severe headache, please can you prescribe a drug for me",
                                                textAlign: TextAlign.left,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "8:30",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Good afternoon, please I want to know if we having long vacation after this semester...?",
                                                textAlign: TextAlign.justify,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "6:20",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Good afternoon, please I want to know if we having long vacation after this semester...?",
                                                textAlign: TextAlign.justify,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "6:20",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Good afternoon, please I want to know if we having long vacation after this semester...?",
                                                textAlign: TextAlign.justify,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "6:20",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xFF359D97),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                                bottomLeft: Radius.circular(8),
                                              )),
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Good afternoon, please I want to know if we having long vacation after this semester...?",
                                                textAlign: TextAlign.justify,
                                              )
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            child: Text(
                                              "6:20",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF359D97),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFF359D97),
                    ),
                    SizedBox(
                      height: 54,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                              ),
                            ),
                            Expanded(
                                child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                hintText: "Message",
                                contentPadding: EdgeInsets.all(4),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF359D97),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              onSubmitted: (result) {
                                _textEditingController.clear();
                              },
                            )),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    */
        );
  }

  List<Message> messages = [
    Message(
        text: "hello insurapp here,",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "how can we help you",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hello insurapp",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hello insurapp",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();
}
