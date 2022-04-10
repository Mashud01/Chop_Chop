import 'package:chop_chop/%20Const/App_Colors.dart';
import 'package:flutter/material.dart';

import 'Nav_Bar/Cart.dart';
import 'Nav_Bar/Favourite.dart';
import 'Nav_Bar/Home.dart';
import 'Nav_Bar/Profile.dart';

class ButtomNavigation extends StatefulWidget {
  //const ButtomNavigation({Key? key}) : super(key: key);

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  final _pages = [
    Home(),
    Favourite(),
    Cart(),

    Profile(),
  ];
  var _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('ChopChap',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.Deep_Orange,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
