import 'package:flutter/material.dart';


class LoadingCard extends StatefulWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  State<LoadingCard> createState() => _LoadingCardState();
}
class _LoadingCardState extends State<LoadingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
