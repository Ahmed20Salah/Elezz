import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/item.dart';
import 'package:elezz/pages/description.dart';
import 'package:elezz/utils/app_localization.dart';
import 'package:elezz/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  @override
  initState() {
    super.initState();
  }

  Color _fontColor = Color(0xffa7a6b2);
  Color _titleColor = Color(0xff33383f);
  Color _mainColor = Color(0xffbca05d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            // _search(context),
            bloc.projects.length > 0
                ? _item(context)
                : Container(
                    height: MediaQuery.of(context).size.height - 40.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          size: 50.0,
                          color: _fontColor,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          DemoLocalization.of(context).word['no_project'],
                          style: TextStyle(
                            fontSize: 22,
                            color: _fontColor,
                          ),
                        ),
                      ],
                    )),
            bloc.projects.length > 0 ? _popular(context) : Container()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(1),
    );
  }

  // search bar
  Widget _search(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 50.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 100.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10),
                  height: 50.0,
                  child: TextFormField(
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      hintText: 'find your house',
                      hintStyle: TextStyle(
                          color: _titleColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                      hasFloatingPlaceholder: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 30.0,
                    color: _mainColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _item(context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Description(bloc.projects[0]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        // height: 350.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                      '${bloc.url}/${bloc.consty}/${bloc.projects[0].images[0]}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 60 / 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '${bloc.projects[0].title}',
                            style: TextStyle(
                                color: _titleColor,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          child: Text(
                            'Villa 49 Mansoreya View',
                            style: TextStyle(color: _fontColor, fontSize: 16),
                            softWrap: true,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _mainColor),
                    child: Text(
                      '1M',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _popular(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular',
            style: TextStyle(
                color: _titleColor, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 300.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bloc.projects.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(bloc.projects[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 350.0,
                    width: 250.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${bloc.url}/${bloc.consty}/${bloc.projects[index].images[0]}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 200.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        bloc.projects[index].title,
                                        style: TextStyle(
                                            color: _titleColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Container(
                                      child: Text(
                                        'Villa 49 Mansoreya View',
                                        style: TextStyle(
                                            color: _fontColor, fontSize: 16),
                                        softWrap: true,
                                        maxLines: 3,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _mainColor),
                                child: Text(
                                  '1M',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
