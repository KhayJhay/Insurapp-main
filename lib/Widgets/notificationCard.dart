import 'package:flutter/material.dart';
import 'package:insurapp/Models/noty_model.dart';

class NotificationCard extends StatefulWidget {
  NotificationModel notify;
  NotificationCard({Key? key, required this.notify}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.blue[100],
      title: Text(
        'From: ${widget.notify.sender}',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF303F46),
          fontFamily: "Poppins-Bold",
        ),
      ),
      subtitle: Text(
        'Date: ${widget.notify.createdOn}',
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF303F46),
          fontFamily: "Poppins",
        ),
      ),
      childrenPadding: EdgeInsets.all(10),
      children: [
        Text(
          '${widget.notify.content}',
          softWrap: true,
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 47, 54, 58),
            fontFamily: "Poppins",
          ),
        )
      ],
    );
  }
}
// Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           Text(
//             'From: Claim Service',
//             style: TextStyle(
//               fontSize: 16,
//               color: Color(0xFF303F46),
//               fontFamily: "Poppins-Bold",
//             ),
//           ),
//           Text(
//             '',
//             maxLines: 3,
//             softWrap: true,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               fontSize: 10,
//               color: Color.fromARGB(255, 47, 54, 58),
//               fontFamily: "Poppins",
//             ),
//           )
//         ],
//       ),
//     );