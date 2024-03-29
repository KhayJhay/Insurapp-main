import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insurapp/Widgets/appBarHead.dart';
import 'package:provider/provider.dart';

import '../Models/noty_model.dart';
import '../providers/notify_provider.dart';
import '../providers/theme_provider.dart';

class StartClaim extends StatefulWidget {
  const StartClaim({Key? key}) : super(key: key);

  @override
  State<StartClaim> createState() => _StartClaimState();
}

class _StartClaimState extends State<StartClaim> {
  final locaText = TextEditingController();
  int _currentStep = 0;
  bool isSelected = false;
  File? imageFile;

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
        isSelected = true;
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
        isSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
            : Colors.black;
    return HeaderAppBar(
      child: SingleChildScrollView(
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
                  "Start Claim",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins-Bold",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Create A New Claim',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Please  go through the process below to tell us about your incident or the problem you are facing',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Poppins-Regular'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Stepper(
                  steps: [
                    Step(
                      title: Text(
                        "Start Claim",
                      ),
                      content: Text("Initialize Claim"),
                      isActive: _currentStep >= 0,
                    ),
                    Step(
                      title: Text("Share Media"),
                      subtitle: Text("Share Images or Video"),
                      isActive: _currentStep >= 1,
                      content: Column(
                        children: [
                          isSelected
                              ? SizedBox(
                                  width: 100,
                                  height: 70,
                                  child: Image.file(imageFile!),
                                )
                              : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _button('Photo', Icons.picture_in_picture,
                                  () => _showPicker(context)),
                              Text('Or'),
                              _button('Video', Icons.video_camera_front, () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: Text("Add Location"),
                      subtitle: Text("Add Location of Incident"),
                      isActive: _currentStep >= 2,
                      content: TextFormField(
                        controller: locaText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_city),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Step(
                        title: Text("Submit Claim"),
                        isActive: _currentStep >= 3,
                        content: Text("Submit claim for Claim")),
                    Step(
                        title: Text("Claim Completed"),
                        isActive: _currentStep >= 4,
                        content: Text("Claim processed succesfully")),
                  ],
                  currentStep: _currentStep,
                  onStepTapped: (index) {
                    setState(() => _currentStep = index);
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_currentStep >= 4) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          title: "Not Allowed",
                          desc: "You can't cancel already submitted claim",
                          btnOkOnPress: () {},
                        )..show();
                      } else if (_currentStep == 0) {
                        _currentStep = 0;
                      } else {
                        _currentStep -= 1;
                      }
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      if (_currentStep >= 4) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: "Successful Submited",
                          desc: 'Your claim has been submitted',
                          btnOkOnPress: () {},
                        )..show();
                        NotificationProvider().changeToRead(true);
                        NotificationProvider().addNotify(NotificationModel(
                          sender: 'Claim Sent',
                          content:
                              'Your claim has been submitted, We will attend to you shortly. Your location is ${locaText.text}',
                          createdOn: DateTime.now(),
                        ));
                        _currentStep = 0;
                      } else {
                        if (_currentStep == 1) {
                          if (isSelected == false) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              title: "Image or Video can't be empty",
                              desc: 'You have to provide an image or a video',
                              btnOkOnPress: () {},
                            )..show();
                          } else {
                            _currentStep += 1;
                          }
                        } else if (_currentStep == 2) {
                          if (locaText.text.isEmpty) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              title: "Field Is Empty",
                              desc: 'You have to provide your location',
                              btnOkOnPress: () {},
                            )..show();
                          } else {
                            _currentStep += 1;
                          }
                        } else {
                          _currentStep += 1;
                        }
                      }
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _button(String title, IconData icon, VoidCallback onClick) {
    return ElevatedButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ]),
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
