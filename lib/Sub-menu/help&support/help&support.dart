import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Home/checkerpage/checker_page.dart';
import 'package:insurapp/Home/mainpage.dart';
import 'package:insurapp/Sub-menu/about_insurapp.dart';
import 'package:insurapp/Sub-menu/chat_screen/customer_serv_chat.dart';
import 'package:insurapp/Sub-menu/help&support/Road%20Assistance.dart';
import 'package:provider/provider.dart';
import '../../Home/change_theme_button_widget.dart';
import '../../providers/theme_provider.dart';
class Help_Support extends StatelessWidget {
  const Help_Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    final color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Colors.white;
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    final welcome_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade800 : Color(0xFFE3E7E8);
    final bodytext_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Color(0xFF303F46);
    final shadowcolor = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbar_color,
        toolbarHeight: 75,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainpage()));
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: welcome_color,
                border: Border(bottom: BorderSide(color: Colors.black12,)),
              ),
              child: Center(
                child: Text("Help & Support",style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins-Medium",
                  color: bodytext_color,
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      sliver: SliverGrid.count(
                        crossAxisCount:2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(20),
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
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/policy.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text("Manage Policy",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                      color: bodytext_color,
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Text("Check and Manage your policies, renew if outdated",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins-Light',
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Checker_Page()));
                            },
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Chats_Page()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(20),
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
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/customer.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text("Chat With Us",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Text("Having a problem, contact or chat with us",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-Light',
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Road_Assistance_Page()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(20),
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
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/road.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text("Road Assistance",style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Text("Do you need us to assist you?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins-Light',
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => About_Insurapp()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(20),
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
                                            color: color,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Image.asset('assets/pngs/logobg1c.png')
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text("More about Insurapp",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins-SemiBold',
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                                    child: Text("Learn more about Insurapp",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins-Light',
                                      ),),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0,),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: welcome_color,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey,width: 0.5)
                  ),
                  child: Center(
                    child: Text("BACK",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontFamily: "Poppins-SemiBold",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
