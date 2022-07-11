import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Road_Assistance_Page extends StatelessWidget {
  const Road_Assistance_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell_solid, color: Colors.grey,size: 26,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: Color(0xFFE3E7E8),
                border: Border(bottom: BorderSide(color: Colors.black12,)),
              ),
              child: Center(
                child: Text("Road Assistance",style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins-Medium",
                  color: Color(0xFF303F46),
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left: 30),
              child: Text("How may we assist you?",style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins-SemiBold',
                color: Colors.black,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 30),
              child: Text("Select the challenge you're facing from the menu below",style: TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins-Light',
                color: Colors.black,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      sliver: SliverGrid.count(
                        crossAxisCount:2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 13,
                        childAspectRatio: 1.1,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h1.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Low Fuel",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h2.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Flat Tire",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h3.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Recovery",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h5.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Dead Battery",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h7.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Engine Heat",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Image.asset('assets/pngs/h6.png')
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Engine Oil",style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.black,
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
