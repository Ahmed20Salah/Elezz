import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/item.dart';
import 'package:elezz/pages/description.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:elezz/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  Color _titleColor = Color(0xff33383f);
  Color _mainColor = Color(0xffbca05d);
  Color _fontColor = Color(0xffa7a6b2);

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
              Text(
                DemoLocalization.of(context).word['favorite'],
                style: TextStyle(
                  fontSize: 22,
                  color: _titleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${bloc.favorite.length} ${DemoLocalization.of(context).word['favorite_result']}',
                style: TextStyle(color: _fontColor, fontSize: 16),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 150.0,
                child: ListView.builder(
                  itemCount: bloc.favorite.length,
                  itemBuilder: (context, index) {
                    return _item(context, bloc.favorite[index].projectId);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(2),
    );
  }

  Widget _item(context, id) {
    int _index = 0;
    for (int i = 0; i < bloc.projects.length; i++) {
      if (bloc.projects[i].id == id) {
        print(i);
        _index = i;
      }
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Description(bloc.projects[_index]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Container(
              height: 130.0,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                        '${bloc.url}/${bloc.consty}/${bloc.projects[_index].images[0]}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Container(
              height: 110.0,
              width: MediaQuery.of(context).size.width - 200.0,
              margin: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bloc.projects[_index].title,
                    style: TextStyle(
                        fontSize: 18,
                        color: _titleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${bloc.projects[_index].size} sqlt',
                    style: TextStyle(color: _fontColor),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '300 sqlt',
                    style: TextStyle(color: _fontColor),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${bloc.projects[_index].size} \$',
                    style: TextStyle(
                        color: _mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
