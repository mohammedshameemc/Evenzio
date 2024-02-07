import 'package:firstproject/constance/colors.dart';
import 'package:firstproject/user/favorite.dart';
import 'package:firstproject/user/home.dart';
import 'package:firstproject/user/home1.dart';
import 'package:firstproject/user/profile.dart';
import 'package:firstproject/user/review.dart';
import 'package:flutter/material.dart';

class bottamNavigation extends StatefulWidget {
String userId;
String userName;
List itemid;

   bottamNavigation({super.key,required this.userId,required this.userName,required this.itemid});

  @override
  State<bottamNavigation> createState() => _bottamNavigationState();
}

class _bottamNavigationState extends State<bottamNavigation> {
  int selectedIndex = 0;



  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;
      print(selectedIndex.toString()+"ppkk");
    });

  }
  Widget build(BuildContext context) {
    var pages = [
      home1(userId: widget.userId),
      Review(userId: widget.userId,userName: widget.userName,),
      favorite(userid: widget.userId,itemid: [widget.itemid]),
      profile(userId: widget.userId,username: widget.userName,)

    ];
    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(
        body: pages[selectedIndex],
        extendBody: true,
        bottomNavigationBar:  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
            // enableFloatingNavBar: true,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          backgroundColor: maincolor,
            currentIndex: selectedIndex,

            onTap: _itemTapped,
            items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.my_library_books_sharp), label: "Review"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),


            ],

        ) );
    }
}
