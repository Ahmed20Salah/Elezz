import 'package:elezz/pages/favorite.dart';
import 'package:elezz/pages/home.dart';
import 'package:elezz/pages/profile.dart';
import 'package:elezz/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int active;
  CustomBottomBar(this.active);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: active,
      unselectedItemColor: Colors.black26,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffbca05d),
      onTap: (val) {
        switch (val) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Favorite(),
              ),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(
            Icons.home,
            size: 30.0,
          ),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(
            Icons.apps,
            size: 30.0,
          ),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(
            Icons.bookmark,
            size: 30.0,
          ),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(
            Icons.person,
            size: 30.0,
          ),
        )
      ],
    );
  }
}
