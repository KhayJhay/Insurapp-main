import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurapp/Models/noty_model.dart';
import 'package:insurapp/Widgets/loading_card.dart';
import 'package:insurapp/providers/notify_provider.dart';

import '../../Models/insura_.model.dart';
import '../../Widgets/appBarHead.dart';
import '../../data_service/insura_data.dart';

class DigitalForm extends StatefulWidget {
  String? cardID;
  String? policyID;
  bool? isActive;
  DigitalForm({Key? key, this.cardID, this.policyID, this.isActive})
      : super(key: key);

  @override
  State<DigitalForm> createState() => _DigitalFormState();
}

class _DigitalFormState extends State<DigitalForm> {
  final policID = TextEditingController();

  late InsuraCardModel cardModel;

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

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
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
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final ImagePicker _picker = ImagePicker();

    final userID = FirebaseAuth.instance.currentUser!.uid;
    //checking policy id
    if (widget.policyID!.isNotEmpty) {
      setState(() {
        policID.text = widget.policyID.toString();
      });
    }
    if (widget.isActive != null) {
      setState(() {
        isActive = widget.isActive!;
      });
    }
    InsuraData.checker(context, policID.text).then((response) {
      if (response['status'] == false) {
        setState(() {
          isActive = true;
          cardModel = response['data'];
        });
      } else {
        setState(() {
          isActive = false;
          cardModel = response['data'];
        });
      }
    });

    return HeaderAppBar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              width: _width,
              decoration: BoxDecoration(
                color: Color(0xFFE3E7E8),
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12,
                )),
              ),
              child: Center(
                child: Text(
                  "Add Digital ID",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins-Medium",
                    color: Color(0xFF303F46),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: isCheck ? 180 : 140,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => _showPicker(context),
                            child: isCheck
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(imageFile),
                                    child: Center(
                                        child: Icon(Icons.add, size: 50)),
                                  )
                                : CircleAvatar(
                                    radius: 40,
                                    child: Center(
                                        child: Icon(Icons.add, size: 50)),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Choose Profile', style: TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: TextFormField(
                        controller: policID,
                        decoration: InputDecoration(
                          hintText: 'eg: 123456789',
                          labelText: 'Policy Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            isActive ? 'Active' : 'Inactive',
                            style: TextStyle(
                                color: isActive ? Colors.green : Colors.red,
                                letterSpacing: 2),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    isLoading
                        ? LoadButton()
                        : Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                if (imageFile.isAbsolute) {
                                  InsuraData.addDigitalCard(
                                          context,
                                          userID.toString(),
                                          cardModel,
                                          base64.encode(
                                              imageFile.readAsBytesSync(),),)
                                      .then((value) {
                                    NotificationProvider().changeToRead(true);
                                    NotificationProvider()
                                        .addNotify(NotificationModel(
                                      sender: 'Digital ID',
                                      content:
                                          'Your digital id has been created successfully, With this policy number $policID. Enjoy your service',
                                      createdOn: DateTime.now(),
                                    ));
                                  });
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Create ID',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 33, 187, 243)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        _getFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _getFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
