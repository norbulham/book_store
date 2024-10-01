import 'package:book_store_managestate/pages/book_pages.dart';
import 'package:book_store_managestate/pages/userinfro_page.dart';
import 'package:book_store_managestate/pages/delivery_pages.dart';
import 'package:book_store_managestate/pages/favorite_pages.dart';
import 'package:book_store_managestate/pages/homepages.dart';
import 'package:book_store_managestate/pages/profile_pages.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});

  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();
}

class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    BookHomepages(),
    MyCartPage(),
    Favorite(),
    ProfilePage(),
  ];

  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.auto_stories,color: Colors.white,),
    Icon(Icons.favorite,color: Colors.white,),
    Icon(Icons.person,color: Colors.white,),
  ];


  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color:Colors.blueAccent ,

        buttonBackgroundColor:Colors.blue,
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}



