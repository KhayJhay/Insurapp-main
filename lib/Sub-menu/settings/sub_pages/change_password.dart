import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurapp/Authentication/login&register_page.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../../Home/change_theme_button_widget.dart';
import '../../../providers/theme_provider.dart';
class ChangePassword_Page extends StatefulWidget {
  const ChangePassword_Page({Key? key}) : super(key: key);

  @override
  State<ChangePassword_Page> createState() => _ChangePassword_PageState();
}

class _ChangePassword_PageState extends State<ChangePassword_Page> {

  final _formKey = GlobalKey<FormState>();

  var newPassword = " ";

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;

  ChangePassword() async {
    try{
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Register_Page()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your password has been changed...Login Again")));
    } catch(error){

    }
  }

  @override
  Widget build(BuildContext context) {
    final appbar_color = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? Colors.grey.shade700 : Colors.white;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar_color,
        elevation: 0,
        toolbarHeight: 75,
        centerTitle: true,
        title: SizedBox(
            height: 140,
            width: 200,
            child: Image.asset("assets/pngs/logobg1.png")),
        leading: ChangeThemeButtonWidget(),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(padding: const EdgeInsets.all(10),
                child: Lottie.asset("assets/lotties/change.json", height: 250,width: 250),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: newPasswordController,
                  autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "New password",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 13,
                    ),
                    hintText: "Enter new password",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                 if(_formKey.currentState!.validate()){
                   setState(() {
                     newPassword = newPasswordController.text;
                   });
                   ChangePassword();
                 }
                },
                color: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
