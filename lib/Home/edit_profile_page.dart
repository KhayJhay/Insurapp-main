import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurapp/Sub-menu/settings/settings_page.dart';
import 'package:provider/provider.dart';

import '../Models/insura_.model.dart';
import '../Models/users.dart';
import '../data_service/insura_data.dart';
import '../providers/dig_providers.dart';
import '../providers/theme_provider.dart';

class Edit_Profile_Page extends StatefulWidget {
  static String id = 'edit_profile';
  const Edit_Profile_Page({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_Page> createState() => _Edit_Profile_PageState();
}

class _Edit_Profile_PageState extends State<Edit_Profile_Page> {
  bool showPassword = false;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  bool isCheck = false;
  bool isActive = false;
  bool isLoading = false;

  late File imageFile;

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        isCheck = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromJson(value.data());
      setState(() {});
    });
  }

  late InsuraCardModel picModel;
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE8F3F3);
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade700
            : Colors.white;
    final welcome_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey.shade800
            : Color(0xFFE3E7E8);
    final bodytext_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Color(0xFF303F46);

    final userID = FirebaseAuth.instance.currentUser!.uid;
    DigitalIDModel digitalIDModel =
        Provider.of<DigitalProvider>(context).digitalIDModel;
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
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Settings_Screen.id);
            },
            icon: Icon(
              CupertinoIcons.settings,
              color: Colors.grey,
              size: 26,
            ),
          ),
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
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
              ),
              child: Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Medium",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 650,
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          isCheck
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: FileImage(imageFile),
                                  child:
                                      Center(child: Icon(Icons.add, size: 50)),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  child: Center(
                                      child: Icon(Icons.person, size: 50)),
                                ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  _getFromGallery();
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    buildTextField(
                        "Full Name", "${loggedInUser.username}", false),
                    buildTextField("E-mail", "${loggedInUser.email}", false),
                    buildTextField("Password", "********", true),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.redAccent,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('digitalCard')
                                .doc(FirebaseFirestore.instance
                                    .collection('digitalCard')
                                    .where('userId',
                                        isEqualTo: FirebaseAuth
                                            .instance.currentUser!.uid)
                                    .toString())
                                .update({
                              "profile": base64.encode(
                                imageFile.readAsBytesSync(),
                              ),
                            }).then((result) {
                              print("new USer true");
                            }).catchError((onError) {
                              print("onError");
                            });
                          },
                          color: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SAVE",
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    final appbar_color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: appbar_color,
            )),
      ),
    );
  }
}
