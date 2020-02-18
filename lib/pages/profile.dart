import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/app_model.dart';
import 'package:elezz/pages/login.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:elezz/widgets/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Profile extends StatelessWidget {
  final Color _mainColor = Color(0xffbca05d);
  final List<String> lang = ['عربي', 'Engilsh'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: bloc.user == null
            ? Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'you have to Sign up !',
                      style: TextStyle(
                          color:Color(0xffa7a6b2),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: _mainColor),
                        height: 60.0,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        DemoLocalization.of(context).word['profile'],
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      alignment: Alignment.center,
                      child: Container(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Icon(
                            Icons.person,
                            size: 70.0,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 25.0,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: _mainColor),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.person,
                                    color: _mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  DemoLocalization.of(context).word['name'],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              bloc.user.firstName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 60.0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0),
                                  // decoration: BoxDecoration(
                                  // border: Border.all(),
                                  // borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    CupertinoIcons.mail,
                                    size: 30.0,
                                    color: _mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  DemoLocalization.of(context).word['email'],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 33.0),
                            child: Text(
                              bloc.user.email,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0),
                                  // decoration: BoxDecoration(
                                  // border: Border.all(),
                                  // borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.rate_review,
                                    size: 30.0,
                                    color: _mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  DemoLocalization.of(context).word['rate_app'],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.translate,
                            color: _mainColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            height: 20.0,
                            child: Text(
                              DemoLocalization.of(context).word['lang'],
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   child: Text(
                    //     'Our Contacts',
                    //     style: TextStyle(
                    //         color: _mainColor,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Container(
                    //   height: 30.0,
                    //   child: Row(
                    //     children: <Widget>[
                    //       IconButton(icon: Idon, onPressed: null)
                    //     ],
                    //   ),
                    // )

                    ScopedModelDescendant(
                      builder: (context, _, AppModel model) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black45)),
                          child: DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            onChanged: (val) {
                              if (val == 'عربي') {
                                model.changeLanguage(Locale('ar'));
                              } else {
                                model.changeLanguage(Locale('en'));
                              }
                            },
                            style: TextStyle(fontSize: 20.0),
                            value: model.appLocale.languageCode == 'ar'
                                ? lang[0]
                                : lang[1],
                            items: lang.map(
                              (item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Container(
                                    child: Text(
                                      item,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      },
                    ),

                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(0),
                                  // decoration: BoxDecoration(
                                  // border: Border.all(),
                                  // borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.subdirectory_arrow_left,
                                    size: 30.0,
                                    color: _mainColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    bloc.logout();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    DemoLocalization.of(context)
                                        .word['signout'],
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: CustomBottomBar(3),
    );
  }
}
