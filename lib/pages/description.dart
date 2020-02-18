import 'package:elezz/data/bloc.dart';
import 'package:elezz/model/item.dart';
import 'package:elezz/pages/requset.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final Item _item;
  Description(this._item);
  @override
  State<StatefulWidget> createState() {
    return _Description();
  }
}

class _Description extends State<Description> {
  bool isFavorite;
  var _selected;
  initState() {
    _selected = widget._item.images[0];
    isFavorite = bloc.checkFavoirte(widget._item);
    super.initState();
  }

  Color _iconColor = Color(0xff3c4042);
  Color _fontColor = Color(0xffa7a6b2);
  Color _borderColor = Color(0xffd7d7d7);
  Color _titleColor = Color(0xff33383f);
  Color _mainColor = Color(0xffbca05d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _projectPic(context),
            __slider(),
            _title(),
            _ratePrice(),
            _girdView(),
            _description(),
            _downloadPdf(),
            _buy()
          ],
        ),
      ),
    );
  }

  Widget _projectPic(context) {
    // print(_selected);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            image: NetworkImage('${bloc.url}/${bloc.consty}/$_selected'),
            fit: BoxFit.cover),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if (isFavorite) {
                    print(  bloc.deleteFavorite(widget._item));
                      setState(() {
                        isFavorite = false;
                      });
                    } else {
                      bloc.addFavorite(widget._item);

                      setState(() {
                        isFavorite = true;
                      });
                    }
                  },
                  child: isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget __slider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget._item.images.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selected = widget._item.images[index];
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${bloc.url}/${bloc.consty}/${widget._item.images[index]}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        },
      ),
    );
  }

  // title & loaction
  Widget _title() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 60 / 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    widget._item.title,
                    style: TextStyle(
                        fontSize: 22,
                        color: _titleColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black26,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        widget._item.location,
                        style: TextStyle(color: _fontColor, fontSize: 16),
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: _borderColor),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Text(
                'view on map',
                style: TextStyle(
                  color: _fontColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // rate & price

  Widget _ratePrice() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 60 / 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Container(
                //   height: 20.0,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 5,
                //     itemBuilder: (context, index) {
                //       return Icon(
                //         Icons.star,
                //         color:
                //             index + 1 <= _item.rate ? _mainColor : _fontColor,
                //         size: 22,
                //       );
                //     },
                //   ),
                // ),
                Container(
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget._item.price.toString()}EGP',
                        style: TextStyle(
                            color: _mainColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '/year',
                        style: TextStyle(
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '${bloc.url}/${bloc.consty}/${widget._item.logo}'),
                  fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }

  Widget _girdView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 60.0,
            margin: EdgeInsets.symmetric(vertical: 2.5),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.business,
                        size: 25,
                        color: _iconColor,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.size} sqft',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.business,
                        size: 25,
                        color: _iconColor,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.bedroom} Bedrooms',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.room_service,
                        size: 25,
                        color: _iconColor,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.size} sqft',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child:
                            Image.asset('assets/shower.png', fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.bedroom} Bedrooms',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.directions_car,
                        size: 25,
                        color: _iconColor,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.garage} Garages',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 55.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: _borderColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child: Image.asset('assets/treeIcon.png',
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        '${widget._item.bedroom} Bedrooms',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: _fontColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // description

  Widget _description() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 22,
                color: _titleColor,
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          //   child: Text(
          //    _item.description,
          //     style:
          //         TextStyle(fontSize: 18, color: _fontColor, wordSpacing: 1.0),
          //   ),
          // )
        ],
      ),
    );
  }

// download pdf
  Widget _downloadPdf() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 62 / 100,
        height: 45.0,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: _mainColor,
        ),
        child: Text(
          'Download Attache PDF FLoor Plan',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // buy

  Widget _buy() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RequestPage(widget._item),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 80 / 100,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: _mainColor,
        ),
        child: Text(
          'Buy Now',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
