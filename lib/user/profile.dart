import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/constance/callfunctions.dart';
import 'package:firstproject/constance/colors.dart';
import 'package:firstproject/provider/loginProvider.dart';
import 'package:firstproject/provider/mainprovider.dart';
import 'package:firstproject/refactorin/widget.dart';
import 'package:firstproject/user/appointment.dart';
import 'package:firstproject/user/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Admin/Request.dart';
import 'loginpage.dart';
import 'moresettings.dart';

class profile extends StatelessWidget {
  String userId;
  String username;
  profile({super.key, required this.userId,required this.username
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: bgImg(),
      child: Scaffold(
        backgroundColor: tranceparent,
        appBar: AppBar(backgroundColor: maincolor,),
        // appBar: AppBar(
        //
        //   leading: Padding(
        //     padding: EdgeInsets.only(bottom: 170),
        //     child: InkWell(
        //         onTap: () {
        //           back(context);
        //         },
        //         child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        //   ),
        //   automaticallyImplyLeading: false,
        //   toolbarHeight: 200,
        //
        //   flexibleSpace: Container(
        //     // height:200,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        //     child: Stack(children: [
        //       // Image(
        //       //   image: AssetImage('assets/Ellipse 4.png'),
        //       //   fit: BoxFit.fill,
        //       // ),
        //       Positioned(
        //           top:50,
        //           left: 150,
        //           child: Consumer<MainProvider>(builder: (context, value, child) {
        //             return value.photo != ''
        //                 ? CircleAvatar(
        //                     backgroundImage: NetworkImage(value.photo),
        //                     radius: 45,
        //                     backgroundColor: Color(0xffD9D9D9),
        //                   )
        //                 : CircleAvatar(
        //                     radius: 45,
        //                     backgroundColor: Color(0xffD9D9D9),
        //                     child: Icon(
        //                       Icons.person,
        //                       color: Colors.white,
        //                       size: 60,
        //                     ),
        //                   );
        //           }))
        //     ]),
        //   ),
        //
        //   backgroundColor: maincolor,
        //   title: Padding(
        //     padding: EdgeInsets.only(bottom: 30),
        //     child: Consumer<MainProvider>(builder: (context, value, child) {
        //       return Center(child: text1(24, value.name));
        //     }),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [SizedBox(
              height: 20,
            ),
              Consumer<MainProvider>(builder: (context, value, child) {
                        return value.photo != ''
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(value.photo),
                                radius: 45,
                                backgroundColor: Color(0xffD9D9D9),
                              )
                            : CircleAvatar(
                                radius: 45,
                                backgroundColor: Color(0xffD9D9D9),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 60,
                                ),
                              );
                      }),
            Consumer<MainProvider>(builder: (context, value, child) {
                return Center(child: text1(24, value.name));
              }),
              Container(
                margin: EdgeInsets.all(20),
                height: height*0.75,
                width: width,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(spreadRadius: 1,color: Colors.grey, blurRadius: 2)],
                  borderRadius: BorderRadius.circular(20),
                  color: color2,
                ),
                child: Consumer<MainProvider>(builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          text2(16, value.name),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            text2(16, value.address),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            text2(16, value.phone),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text2(16, "More Settings"),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                callNext(context, settings(userid: userId,username: username,));
                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text2(18, "Logout"),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          title: Center(child: text2(24, "Logout?")),
                                          backgroundColor: color2,
                                          content:
                                              text2(16, "Do you want conform/reject"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  back(context);
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: GoogleFonts.inknutAntiqua(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: red,
                                                  ),
                                                )),
                                            Consumer<loginProvider>(
                                                builder: (context, value, child) {
                                              return TextButton(
                                                  onPressed: () {
                                                    FirebaseAuth auth =
                                                        FirebaseAuth.instance;
                                                    auth.signOut();
                                                    value.clearLogin();

                                                    callNextReplacement(
                                                        context, loginpage());
                                                  },
                                                  child: Text(
                                                    "Confirm",
                                                    style: GoogleFonts.inknutAntiqua(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ));
                                            })
                                          ],
                                        ));
                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text2(16, "Edit Profile"),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                value.getUser();
                                callNext(
                                    context,
                                    registration(
                                      from: "EDIT",
                                      profileid: userId,
                                    ));
                              },
                              icon: Icon(Icons.edit, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text2(16, "Appoitment"),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                value.getuserorderdetils(userId);
                                callNext(context, appointment());

                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                  SizedBox(
                    height: 15,
                  )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
