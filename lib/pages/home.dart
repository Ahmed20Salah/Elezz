import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/company.dart';
import 'package:elezz/pages/companyDescription.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:elezz/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  List<Company> _obj = [
    Company(name: 'ElNourhan Company', image: 'assets/elnourhan.png'),
    Company(name: 'ElShorka Company', image: 'assets/shorka.png'),
  ];

  List<Company> _pro = [
    Company(name: 'EL NOURHAN PROJECT', image: 'assets/elnourhan.png'),
    Company(name: 'MANSOREYA VIEW', image: 'assets/mansoreya.png'),
    Company(name: 'La joie', image: 'assets/lajoie.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  DemoLocalization.of(context).word['about_us'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 170.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/apart1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  DemoLocalization.of(context).word['des'],
                  style: _titleStyle(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  DemoLocalization.of(context).word['company_des'],
                  softWrap: true,
                  maxLines: 7,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Container(
                child: Text(
                  DemoLocalization.of(context).word['our_companies'],
                  style: _titleStyle(),
                ),
              ),
              Container(
                height: 130.0,
                child: GridView.count(
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  children: <Widget>[
                    _logo(context, _obj[0], DemoLocalization.of(context).word['nour_des']),
                    _logo(context, _obj[1], DemoLocalization.of(context).word['shokrak_des']),
                  ],
                ),
              ),
              Container(
                child: Text(
                  DemoLocalization.of(context).word['our_projects'],
                  style: _titleStyle(),
                ),
              ),
              Container(
                height: 200.0,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: GridView.count(
                  padding: EdgeInsets.all(0),
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10.0,
                  children: <Widget>[
                    _logo(context, _pro[1] , DemoLocalization.of(context).word['mans']),
                    _logo(context, _pro[2] , DemoLocalization.of(context).word['lajoie_des']),
                    _logo(context, _pro[0],  DemoLocalization.of(context).word['nour_des']),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(0),
    );
  }

  TextStyle _titleStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);
  }

  Widget _logo(context, _company, des) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_company.image), fit: BoxFit.cover),
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyDescription(_company , des),
          ),
        );
      },
    );
  }
}
