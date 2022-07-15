import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:insurapp/Sub-menu/chat_screen/components/app_constatns.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import 'components/comming_message_bubble.dart';
import 'components/dummy_data.dart';
import 'components/message_buble.dart';

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
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: AppDummyData.messages.length,
                itemBuilder: (ctx, i) {
                  if (AppDummyData.messages[i].commingMessage) {
                    return CommingMessageBuble(
                      messageModel: AppDummyData.messages[i],
                    );
                  } else {
                    return MessageBuble(
                      messageModel: AppDummyData.messages[i],
                    );
                  }
                },
                reverse: false,
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 3),
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: appbar_color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic,
                          color: AppColors.grey,
                          size: 22,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type message',
                            hintStyle: const TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                            contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 5, 5),
                            fillColor: AppColors.darkWhite,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.rose,
                          size: 22,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send_rounded,
                          color: AppColors.rose,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  AppBar _appBar(BuildContext context) {
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appbar_color,
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.rose,
              size: 20,
            ),
          ),
          const CircleAvatar(
            backgroundColor: AppColors.rose,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Insurapp Team',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: "Poppins-SemiBold",
                    height: 1.3),
              ),
              Text(
                'Active now',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          // ignore: avoid_print
          onPressed: () => print('Call'),
          icon: SvgPicture.asset(
            'assets/svgs/phone_call.svg',
            height: 20,
            width: 20,
            color: AppColors.rose,
          ),
        ),
        IconButton(
          // ignore: avoid_print
          onPressed: () => print('Search'),
          icon: SvgPicture.asset(
            'assets/svgs/search.svg',
            height: 20,
            width: 20,
            color: AppColors.rose,
          ),
        ),
      ],
    );
  }
}

