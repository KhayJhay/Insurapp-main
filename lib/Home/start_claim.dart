import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class StartClaim extends StatefulWidget {
  const StartClaim({Key? key}) : super(key: key);

  @override
  State<StartClaim> createState() => _StartClaimState();
}

class _StartClaimState extends State<StartClaim> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F4),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.chevron_back, color: Colors.grey,size: 26,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell_solid, color: Colors.grey,size: 26,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: Color(0xFFE3E7E8),
                border: Border(bottom: BorderSide(color: Colors.black12,)),
              ),
              child: Center(
                child: Text("Start Claim",style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins-Bold",
                  color: Color(0xFF303F46),
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Stepper(
                    steps: const [
                      Step(title: Text("Start Claim"),
                          content:Text("Initialize Claim")
                      ),
                      Step(title: Text("Share Media"),
                          content:Text("Share Images or Video")
                      ),
                      Step(title: Text("Add Location"),
                          content:Text("Add Location of Incident")
                      ),
                      Step(title: Text("Submit Claim"),
                          content:Text("Submit claim for Claim")
                      ),
                      Step(title: Text("Claim Completed"),
                          content:Text("Claim processed succesfully")
                      ),
                    ],
                  onStepTapped: (int newIndex){
                      setState(() {
                        _currentStep = newIndex;
                      });
                  },
                  currentStep: _currentStep,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
