import 'package:elezz/data/bloc.dart';
import 'package:elezz/pages/home.dart';
import 'package:elezz/pages/register.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Color _mainColor = Color(0xffbca05d);
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 40.0,
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
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      DemoLocalization.of(context).word['login'],
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 50.0,
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
                            validator: (val) {
                              if (val.isEmpty ||
                                  val.length <= 2 ||
                                  !val.contains('@')) {
                                return 'please write a vaild Email';
                              }
                            },
                            controller: _email,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              decoration: TextDecoration.none,
                            ),
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
                            DemoLocalization.of(context).word['password'],
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty || val.length <= 5) {
                                return 'please write a vaild password min 6';
                              }
                            },
                            controller: _password,
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
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () async {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _loading = true;
                          });
                          var re =
                              await bloc.login(_email.text, _password.text);
                          if (re['status']) {
                            setState(() {
                            _loading = false;
                          });
                            bloc.getFavorite();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else {
                            setState(() {
                            _loading = false;
                          });
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
                        child: _loading
                            ? CircularProgressIndicator(backgroundColor: _mainColor,)
                            : Text(
                                DemoLocalization.of(context).word['login'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   child: InkWell(
                    //     child: Text(
                    //       'forget your password?',
                    //       style: TextStyle(color: _mainColor),
                    //     ),
                    //   ),
                    // ),
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
                        margin: EdgeInsets.symmetric(vertical: 15.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              DemoLocalization.of(context).word['no_account'],
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text(
                              DemoLocalization.of(context).word['register_now'],
                              style: TextStyle(color: _mainColor),
                            ),
                          ],
                        ),
                      ),
                    )
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
}
