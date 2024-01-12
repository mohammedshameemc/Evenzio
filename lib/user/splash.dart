import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/constance/callfunctions.dart';
import 'package:firstproject/constance/colors.dart';
import 'package:firstproject/user/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/loginProvider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    loginProvider LoginProvider =
    Provider.of<loginProvider>(context,listen:false);

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;




    Timer( Duration(seconds: 4), () {

      if (loginUser == null) {

        callNextReplacement(context, loginpage());
      }
      else {
        LoginProvider.userAuthorisation(loginUser.phoneNumber, context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.fill)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Evenzio",style:GoogleFonts.cevicheOne (fontSize: 60,color: Colors.white),),
                      Text("Catering Event",style:GoogleFonts.alexBrush(fontSize: 30,color: Colors.white),),


                    ],
                  ),
                ),

              ],
              ),
        ),
        );
    }
}