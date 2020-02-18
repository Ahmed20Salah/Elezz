import 'dart:async';

import 'package:elezz/data/bloc.dart';
import 'package:elezz/pages/home.dart';
import 'package:elezz/pages/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  Color _mainColor = Color(0xffbca05d);
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _start();
    super.initState();
  }

  void _start() async {
    Timer(Duration(minutes: 1), () {
      _key.currentState.showSnackBar(
        SnackBar(
          content: Container(
            height: 20.0,
            child: Center(
              child: Text('No internet Connection'),
            ),
          ),
        ),
      );
    });

    bloc.getProjects();

    bloc.userCheck().then((val) async {
      if (val) {
        await bloc.checklang();
        await bloc.getFavorite().then((cal) {
          fun(Home());
        });
      } else {
        fun(Language());
      }
    });
  }

  void fun(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100.0,
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(backgroundColor: _mainColor),
          )
        ],
      )),
    );
  }
}
