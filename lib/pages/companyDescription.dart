import 'package:elezz/model/company.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompanyDescription extends StatelessWidget {
  final Company _item;
  String des  ;

  CompanyDescription(this._item , des);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '${DemoLocalization.of(context).word['about']} ${_item.name}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_item.image),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                DemoLocalization.of(context).word['des'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
             des,
                maxLines: 4,
                softWrap: true,
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
