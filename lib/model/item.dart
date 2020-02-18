import 'package:flutter/material.dart';

class Item {
  int id;
  String title;
  String logo;
  List<String> images;
  String price;
  String location;
  String lang;
  String lant;
  int rate;
  String size;
  String bedroom;
  String kitchens;
  String bethroom;
  String garage;
  String gardens;
  String description;
  String pdf;

  Item.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['name'];
    images = map['imgs'].split(',');
    price = map['price'];
    location = map['location'];
    logo = map['logo'];
//  lang = map['title'];
//  lant = map['title'];
    rate = map['rate'];
    size = map['sqft'];
    bedroom = map['bedrooms'];
    bethroom = map['bathrooms'];
    garage = map['garage'];
    description = map['des'];
    kitchens = map['kitchens'];
    pdf = map['file'];
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['images'] = images;
    map['price'] = price;
    map['location'] = location;
    map['lang'] = lang;
    map['lant'] = lant;
    map['rate'] = rate;
    map['sqft'] = size;
    map['bedroom'] = bedroom;
    map['bethroom'] = bethroom;
    map['garage'] = garage;
    map['description'] = description;
    map['pdf'] = pdf;

    return map;
  }
}
