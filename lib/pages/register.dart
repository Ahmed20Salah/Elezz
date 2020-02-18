import 'package:elezz/data/bloc.dart';
import 'package:elezz/pages/home.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatelessWidget {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _familyname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  Color _mainColor = Color(0xffbca05d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: MediaQuery.of(context).size.height - 80.0,
              child: Form(
                key: _keyForm,
                child: ListView(
                  children: <Widget>[
                    Text(
                      DemoLocalization.of(context).word['register_now'],
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(color: Colors.black87),
                          // ),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DemoLocalization.of(context).word['first_name'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            controller: _firstname,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Must have a valid value';
                              }
                            },
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(color: Colors.black87),
                          // ),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DemoLocalization.of(context).word['family_name'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            controller: _familyname,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Must have a valid value';
                              }
                            },
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(color: Colors.black87),
                          // ),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DemoLocalization.of(context).word['email'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            controller: _email,
                            validator: (val) {
                              if (val.isEmpty || val.length < 6) {
                                return 'Must have a valid value';
                              }
                            },
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    // //     border: Border(
                    // //       bottom: BorderSide(color: Colors.black87),
                    // //     ),
                    //   ),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Text(
                    //         'Mobile',
                    //         style: _titleStle(),
                    //       ),
                    //       TextFormField(
                    //         controller: _mobile,
                    //         cursorColor: Colors.grey,
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 17,
                    //             decoration: TextDecoration.none),
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(0),
                    //  // border: InputBorder.none,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(color: Colors.black87),
                          // ),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DemoLocalization.of(context).word['password'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            controller: _password,
                            validator: (val) {
                              if (val.isEmpty || val.length < 6) {
                                return 'too short!';
                              }
                            },
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(

                          // border: Border(
                          //   bottom: BorderSide(color: Colors.black87),
                          // ),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DemoLocalization.of(context).word['c_password'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val != _password.text) {
                                return 'Not Match';
                              }
                            },
                            controller: _cpassword,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 20.0),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     'Register by',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       InkWell(
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //           width: 90.0,
                    //           height: 30.0,
                    //           decoration: BoxDecoration(
                    //             color: Colors.indigo,
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //           child: Text(
                    //             'Facebook',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ),
                    //       ),
                    //       InkWell(
                    //         onTap: (){
                    //           _handleSignIn();
                    //         },
                    //         child: Container(
                    //             alignment: Alignment.center,
                    //             width: 90.0,
                    //             height: 30.0,
                    //             decoration: BoxDecoration(
                    //               color: Colors.red,
                    //               borderRadius: BorderRadius.circular(10.0),
                    //             ),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: <Widget>[
                    //                 // Icon(icon)
                    //                 Text(
                    //                   'Gamil',
                    //                   style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //               ],
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () async {
                        _keyForm.currentState.save();
                        if (_keyForm.currentState.validate()) {
                          var re = await bloc.register(
                              '${_firstname.text} ${_familyname.text}',
                              _email.text,
                              _password.text);
                          if (re['status']) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text(re['message']),
                              ),
                            );
                          }
                        } else {
                          return;
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: _mainColor),
                        height: 60.0,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          DemoLocalization.of(context).word['register'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle _titleStle() {
    return TextStyle(color: Colors.grey, fontSize: 16);
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      var re = await _googleSignIn.signIn();
      print(re);
    } catch (error) {
      print(error);
    }
  }
}
