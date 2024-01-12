import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/constance/colors.dart';
import 'package:firstproject/user/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Admin/adminhome.dart';
import '../constance/callfunctions.dart';
import '../user/otp.dart';

class loginProvider extends ChangeNotifier {


  String VerificationId = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

     bool otploader=false;
  void sendotp(BuildContext context) async {
     otploader=true;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        otploader=false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => otp(),
            ));
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),

    );

  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {
       userAuthorisation(user.phoneNumber, context);
      } else {
        if (kDebugMode) {
          print("6546");
        }
      }
    });
  }

  void userAuthorisation(String? phone,BuildContext context,){
    String loginType='';
    String name='';
    String loginphone='';
    String userId='';
    db.collection("USER").where("PHONE",isEqualTo: phone).get().then((value){
      if(value.docs.isNotEmpty){
        for(var e in value.docs){
          Map<dynamic, dynamic> map = e.data();
          loginType= map["TYPE"].toString();
          name= map["NAME"].toString();
          loginphone= map["PHONE"].toString();
          userId = map["USER_ID"].toString();

          if(loginType == "ADMIN"){
            callNextReplacement(context,AdminHome());
          }else{

            callNextReplacement(context, home(userId: userId,userName: name,));
          }
        }
      }
      });
    }
void clearLogin(){

    phoneController.clear();
    otpController.clear();

}
}
