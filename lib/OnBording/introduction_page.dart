import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:insurapp/OnBording/get_started.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/card_insurance.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({Key? key}) : super(key: key);

  final data = [
    CardInsuranceData(
      title: "Begin an Insurance Check",
      subtitle:
          "Directly communicate with insurance company incase of accidents.",
      image: Svg("assets/svgs/search.svg", size: Size(300, 300)),
      backgroundColor: Colors.white,
      titleColor: const Color.fromRGBO(71, 59, 117, 1),
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/lotties/anim4.json"),
    ),
    CardInsuranceData(
      title: "Get Reminders",
      subtitle:
          "Insurapp keeps you updated on policy status through notifications and reminders",
      image: Svg("assets/svgs/not2.svg", size: Size(400, 400)),
      backgroundColor: const Color(0xFF44A8E0),
      titleColor: Colors.white,
      subtitleColor: Colors.white,
      background: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: LottieBuilder.asset("assets/lotties/anim7.json"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        duration: Duration(seconds: 2),
        itemBuilder: (
          int index,
        ) {
          return CardInsurance(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Get_Started()),
          );
        },
      ),
    );
  }
}
