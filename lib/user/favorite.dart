import 'package:firstproject/constance/colors.dart';
import 'package:firstproject/provider/mainprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constance/callfunctions.dart';
import '../refactorin/widget.dart';
import 'details.dart';

class favorite extends StatelessWidget {
  String userid;
  List itemid;


   favorite({super.key,required this.userid,required this.itemid,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // List<String> itemimage=[
    //   "assets/watermelon.png",
    //   "assets/stage2.png",
    //   "assets/mint.png",
    //   "assets/broast.png",
    //   "assets/biriyani.png",
    //   "assets/mandhi.png",
    //
    //
    //
    // ];
    // List<String> itemname=[
    //   "Watermelon",
    //   "Round stage",
    //   "Mint tea",
    //   "Broast ",
    //   "Chicken biriyani",
    //   "Chicken mandi",
    //
    //
    //
    // ];
    // List<String> rate=[
    //   "RS:10(per)",
    //   "RS:8000/- ",
    //   "RS:10(per)",
    //   "RS:50(per)",
    //   "RS:100(per)",
    //   "RS:150(per)",
    //
    //
    //
    // ];

    return  Container( height: height,
      width: width,
      decoration: bgImg(),
      child: Scaffold(
        backgroundColor: tranceparent,
        appBar: AppBar(automaticallyImplyLeading: false,
          backgroundColor: maincolor,


          leading: IconButton(
            onPressed: () {
              back(context);


            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: color2,
                onPressed: () {
                  print("jnfvbjkgnv"+itemid.length.toString());
                  value.clearorder();
                  value.getallitems(userid);

                  callNext(context, details(userid:  userid,itemid:value.itemid,));
                },
                child: text2(10, "Order"),

              );
            }
          ),
        ),

        body:  Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsetsDirectional.all(30),
                      itemCount: value.favoriteList.length,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount 	(
                          mainAxisSpacing:10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 0.8),
                      itemBuilder: (BuildContext context, int index) {
                        var item= value.favoriteList[index];
                        return InkWell(onTap: (){

                        },
                          child:  Container(margin:EdgeInsets.all(5),height: height/3,width: width,
                            decoration: BoxDecoration(

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.grey),],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(item.photo))),
                            child:  Padding(
                              padding:  EdgeInsets.only(top: 120),
                              child: Container(height:50 ,decoration: BoxDecoration(borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),color:Colors.white),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: width/4,
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(item.name,style: GoogleFonts.inknutAntiqua(fontSize:12,fontWeight: FontWeight.w700,color: Colors.black),),

                                            Text(item.rate)
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      InkWell(onTap: () {value.removeFavorite(value.favoriteList[index].id, context);

                                      },child: Icon(Icons.favorite,color: Color(0xfffFF6464),size: 30,))
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          }
        ),

      ),
    );
  }
}
