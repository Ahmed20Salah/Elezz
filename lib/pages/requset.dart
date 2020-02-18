import 'dart:async';

import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/item.dart';
import 'package:elezz/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  final Item _item;
  RequestPage(this._item);
  @override
  State<StatefulWidget> createState() {
    return _RequestPageState();
  }
}

class _RequestPageState extends State<RequestPage> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _job = TextEditingController();
  TextEditingController _phase = TextEditingController();
  TextEditingController _sales = TextEditingController();

  TextEditingController _type = TextEditingController();
  TextEditingController _details = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

Color _mainColor = Color(0xffbca05d);
  List<String> _nows = [
    'الوسيط',
    'انترنت',
    'FM',
    'معارض',
    'عميل متعاقد',
    'الاهرام',
    'FaceBook',
    'فضائيات',
    'لافتات'
  ];
  String _radioValue;
  String _installmentyear;
  String _value = 'الوسيط';
  void change(value) {
    setState(() {
      _radioValue = value;
    });
    print(_radioValue);
  }

  void changeyear(value) {
    setState(() {
      _installmentyear = value;
    });
    print(_installmentyear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Request for Buy',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild value';
                              }
                            },
                            controller: _firstname,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Address',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild value';
                              }
                            },
                            controller: _address,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Your job',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild value';
                              }
                            },
                            controller: _job,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name of sales person',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild Value';
                              }
                            },
                            controller: _sales,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text(
                        'How did you know us',
                        style: _titleStle(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45)),
                      child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          onChanged: (val) {
                            setState(() {
                              _value = val;
                            });
                          },
                          style: TextStyle(fontSize: 20.0),
                          value: _value,
                          items: _nows.map(
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
                          ).toList()),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose Phase ',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild value';
                              }
                            },
                            controller: _phase,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black87),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose Type ',
                            style: _titleStle(),
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'please write a vaild Value';
                              }
                            },
                            controller: _type,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text(
                        'Choose Your Payment system',
                        style: _titleStle(),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: 160.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: _mainColor,
                                  groupValue: _radioValue,
                                  value: 'Cash',
                                  onChanged: change,
                                ),
                                Text('Cash'),
                              ],
                            ),
                          ),
                          Container(
                            height: 30.0,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  activeColor: _mainColor,
                                  groupValue: _radioValue,
                                  value: 'Installment',
                                  onChanged: change,
                                ),
                                Text('Installment'),
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
                      child: Text(
                        'period of installment',
                        style: _titleStle(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 100.0,
                      width: 160.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('1 year'),
                                Radio(
                                  activeColor: _mainColor,
                                  groupValue: _installmentyear,
                                  value: '1 year',
                                  onChanged: changeyear,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('2 year'),
                                Radio(
                                  activeColor: _mainColor,
                                  groupValue: _installmentyear,
                                  value: '2 year',
                                  onChanged: changeyear,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('3 year'),
                                Radio(
                                  activeColor: _mainColor,
                                  groupValue: _installmentyear,
                                  value: '3 year',
                                  onChanged: changeyear,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'More Details ',
                            style: _titleStle(),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: TextFormField(
                              maxLines: 4,
                              controller: _details,
                              cursorColor: Colors.grey,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                decoration: TextDecoration.none,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () async {
                        _formKey.currentState.save();
                        print(_formKey.currentState.validate());

                        var time = DateTime.now();
                        var date = '${time.year}-${time.day}-${time.month}';
                        if (_formKey.currentState.validate()) {
                          if (_radioValue != null || _installmentyear != null) {
                            var re = await bloc.sendReauest(
                                paymentType: _radioValue,
                                id: widget._item.id,
                                name: _firstname.text,
                                address: _address.text,
                                sales: _sales.text,
                                type: _type.text,
                                projectName: widget._item.title,
                                know: _radioValue,
                                job: _job.text,
                                size: widget._item.size,
                                date: date);
                            if (re) {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Container(
                                    alignment: Alignment.center,
                                    height: 20.0,
                                    child: Text('your Request Sent'),
                                  ),
                                ),
                              );
                              Timer(Duration(seconds: 2), () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              });
                            }
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
                          'Send',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStle() {
    return TextStyle(
        color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold);
  }
}
