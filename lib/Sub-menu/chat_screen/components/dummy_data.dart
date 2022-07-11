import 'package:flutter/material.dart';
import 'message_model.dart';

class AppDummyData {
  static List<MessageModel> messages = [
    MessageModel(
      userName: 'Insurapp Team',
      message:
      'Hello?',
      messageTime: DateTime.now().subtract(
        const Duration(hours: 5),
      ),
      commingMessage: false,
      isMessageReaded: true,
    ),
    MessageModel(
      userName: 'Insurapp Team',
      message:
      'Hello!, Welcome to insurapp chat service center, I am Denzel, how may I help you',
      messageTime: DateTime.now().subtract(
        const Duration(hours: 3, minutes: 20),
      ),
      commingMessage: true,
    ),
    MessageModel(
      userName: 'Insurapp Team',
      message:
      'Please i am having issues with my policy details, i need to access it urgently ',
      messageTime: DateTime.now().subtract(
        const Duration(hours: 1, minutes: 10),
      ),
      commingMessage: false,
      isMessageReaded: true,
    ),
    MessageModel(
      userName: 'Insurapp Team',
      message:
      'Kindly drop your policy digits and we will be with you shortly',
      messageTime: DateTime.now().subtract(
        const Duration(minutes: 45),
      ),
      commingMessage: true,

    ),
    MessageModel(
      userName: 'Insurapp Team',
      message:
      'Thank You very much. PN:834773848262',
      messageTime: DateTime.now().subtract(
        const Duration(minutes: 31),
      ),
      commingMessage: false,
      isMessageReaded: true,
    ),
    MessageModel(
      userName: 'Insurapp Team',
      message: 'You are Welcome, Have a great day 😀',
      messageTime: DateTime.now().subtract(
        const Duration(minutes: 45),
      ),
      commingMessage: true,
    ),
  ];
}
