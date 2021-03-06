import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import 'app_constatns.dart';
import 'message_model.dart';

class CommingMessageBuble extends StatelessWidget {
  final MessageModel messageModel;
  const CommingMessageBuble({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: CommingMessageClipper(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(18, 8, 8, 8),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .7,
                ),
                color: appbar_color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      messageModel.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(messageModel.message),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                DateFormat('HH:mm').format(messageModel.messageTime),
                style: const TextStyle(color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommingMessageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(10, 0);

    path.lineTo(size.width - 10, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 10);

    path.lineTo(size.width, size.height - 10);
    path.quadraticBezierTo(
        size.width, size.height, size.width - 10, size.height);

    path.lineTo(0, size.height);
    path.lineTo(10, size.height - 10);

    path.lineTo(10, 10);
    path.quadraticBezierTo(10, 0, 20, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}