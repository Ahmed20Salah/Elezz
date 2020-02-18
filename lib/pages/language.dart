import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/app_model.dart';
import 'package:elezz/pages/switch.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Language extends StatelessWidget {
  final Color _titleColor = Color(0xff33383f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            _logo(context),
            _language()
          ],
        ),
      ),
    );
  }

  // chooes language
  Widget _language() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ScopedModelDescendant(
        builder: (context, _, AppModel model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                DemoLocalization.of(context).word['select_lang'],
                style: TextStyle(
                  color: _titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // arabic
              InkWell(
                onTap: () {
                  model.changeLanguage(Locale('ar'));
                },
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: _titleColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'عربي',
                        style: TextStyle(
                          color: _titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      model.appLocale.languageCode == 'ar'
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              width: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _titleColor,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              // English

              InkWell(
                onTap: () {
                  model.changeLanguage(Locale('en'));
                },
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: _titleColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'English',
                        style: TextStyle(
                          color: _titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      model.appLocale.languageCode == 'en'
                          ? Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              width: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: _titleColor,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: _titleColor),
                      borderRadius: BorderRadius.circular(20)),
                  width: 80.0,
                  height: 35.0,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_forward,
                    color: _titleColor,
                  ),
                ),
                onTap: () {
                  bloc.changelang(model.appLocale);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SwitchPage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _logo(context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logo.png'))),
      width: MediaQuery.of(context).size.width,
      height: 300.0,
    );
  }
}
