import 'package:elezz/pages/login.dart';
import 'package:elezz/pages/register.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  Color _mainColor = Color(0xffbca05d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Container(
            height: 100.0,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              DemoLocalization.of(context).word['discover'],
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
               DemoLocalization.of(context).word['dicover_des'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 150.0,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: _mainColor),
                    height: 60.0,
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      DemoLocalization.of(context).word['register'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.blueGrey)),
                    height: 60.0,
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      DemoLocalization.of(context).word['login'],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
