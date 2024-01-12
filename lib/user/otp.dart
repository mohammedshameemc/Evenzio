import 'package:firstproject/provider/loginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../refactorin/widget.dart';
import 'home.dart';
import 'loginpage.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
        height: height,
        width: width,
        decoration: bgImg(),
    child: Scaffold(

    backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 220,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: text1(32, "Enter OTP"),

            ),
             SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<loginProvider>(
                builder: (context,value,child) {
                  return Pinput(
                    controller: value.otpController,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,keyboardType: TextInputType.number,
                      defaultPinTheme: PinTheme(
                          textStyle:
                          TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration( boxShadow: [
                            BoxShadow(

                              blurRadius: 2.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                            ),
                          ], borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 1,
                                  color:Colors.white.withOpacity(0.9)))),

                      onCompleted: (pin){
                        value.verify(context);

                      },
                      );
                }
              ),
            ),
            SizedBox(height: height/10,),
            Center(child: Text("Resend OTP in: 20 sec",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey.shade400),)),
            SizedBox(height: height/10,),

            Consumer<loginProvider>(
              builder: (context,value,child) {

                return InkWell(onTap: () {
                  value.verify(context);

                },child: button(" Submit",16,height / 18,width / 3,));
              }
            ),

          ],
        ),
      ),

        ));
    }



      






  }

