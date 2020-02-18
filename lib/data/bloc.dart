import 'dart:convert';
import 'package:elezz/model/app_model.dart';
import 'package:elezz/model/favorite.dart';
import 'package:elezz/pages/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elezz/model/item.dart';
import 'package:elezz/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class Provider extends InheritedWidget {
//   final bloc = Bloc();

//   Provider({Key key, Widget child}) : super(key: key, child: child);
//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => true;

//   static Bloc of(context) {
//     return (context.inhertedFromWidgetOfExactType(Provider) as Provider).bloc;
//   }
// }

class _Bloc {
  String url = 'http://elezzgroup.unlimited-soft.com';
  String consty = 'storage/app/public/attachments';
  User user;
  var projects = [];
  List<Item> _projects_ar = [];
  List<Item> _projects_en = [];
  List<FavoriteModel> favorite = [];
  String message = 'wrong Email or password!';

  login(email, password) async {
    var re;
    try {
      re = await http
          .post('$url/api/auth/login?email=$email&password=$password');
      print(re.body);
    } catch (e) {
      print(e);
      return {'message': 'no internet connecation!', 'status': false};
    }
    if (jsonDecode(re.body)['status']) {
      user = User.fromMap(jsonDecode(re.body)['user'][0]);
      print(jsonDecode(re.body)['access_token']);
      try {
        SharedPreferences _per = await SharedPreferences.getInstance();
        var restoken = await _per.setString(
            'token', '${jsonDecode(re.body)['access_token']}');
        var resid =
            await _per.setInt('id', jsonDecode(re.body)['user'][0]['id']);
        var resname = await _per.setString(
            'name', '${jsonDecode(re.body)['user'][0]['name']}');
        var resemail = await _per.setString(
            'email', '${jsonDecode(re.body)['user'][0]['email']}');

        print(
            ' token $restoken & id  = $resid ,  name = $resname , email = $resemail');
      } catch (e) {
        print(e);
      }
    }
    return {'status': jsonDecode(re.body)['status'], 'message': message};
  }

  register(name, email, password) async {
    var re;
    try {
      print('try');
      re = await http.post(
          '$url/api/auth/register?name=$name&email=$email&password=$password');
      print(re.body);
    } catch (e) {
      print(e);
      return {'message': 'no internet connecation!', 'status': false};
    }
    if (jsonDecode(re.body)['status']) {
      user = User.fromMap(jsonDecode(re.body)['user'][0]);
      print(jsonDecode(re.body)['access_token']);
      try {
        SharedPreferences _per = await SharedPreferences.getInstance();
        var restoken = await _per.setString(
            'token', '${jsonDecode(re.body)['access_token']}');
        var resid = _per.setInt('id', jsonDecode(re.body)['user'][0]['id']);
        var resname =
            _per.setString('name', '${jsonDecode(re.body)['user'][0]['name']}');
        var resemail = _per.setString(
            'email', '${jsonDecode(re.body)['user'][0]['email']}');

        print(
            ' token $restoken & id  = $resid ,  name = $resname , email = $resemail');
      } catch (e) {
        print(e);
      }
    }
    return {'status': jsonDecode(re.body)['status'], 'message': message};
  }

  userCheck() async {
    try {
      SharedPreferences _per = await SharedPreferences.getInstance();
      print('search');

      var id = _per.getInt('id');
      if (id != null) {
        user = User.fromMap(
          {
            'name': _per.getString('name'),
            'email': _per.getString('email'),
            'token': _per.getString('token'),
            'id': id
          },
        );
        print(user.id);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  logout() async {
    user = null;
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.setString('token', null);
    pre.setString('email', null);
    pre.setString('name', null);
    pre.setString('id', null);
  }

  getProjects() async {
    var re;
    var data;
    try {
      re = await http.get('$url/api/projects_names');
      if (jsonDecode(re.body)['status']) {
        print(jsonDecode(re.body)['data']);
        data = jsonDecode(re.body)['data']['english'];

        for (int i = 0; i < data.length; i++) {
          _projects_en.add(Item.fromMap(data[i]));
          _projects_ar
              .add(Item.fromMap(jsonDecode(re.body)['data']['arabic'][i]));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  sendReauest(
      {@required date,
      @required name,
      @required job,
      @required address,
      @required projectName,
      @required type,
      @required size,
      @required know,
      @required sales,
      @required id,
      @required paymentType}) async {
    http.Response re;
    try {
      re = await http.post(
          '$url/api/insert_form?date=$date&name=$name&job=$job&payment_type=$paymentType&adress=$address&phone=01098&email=ahmedsalah2820@gmail.com&project_name=$projectName&type=$type&space=$size&know=$know&sales=$sales&id=$id');
      print(jsonDecode(re.body)['status']);
      return jsonDecode(re.body)['status'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  getFavorite() async {
    var re;
    var data;
    try {
      re = await http.get('$url/api/all_fovrites/${user.id}');
      data = jsonDecode(re.body);
      if (data['status']) {
        if (data['data'].length > 0) {
          print(data['data'].length);
          for (int i = 0; i < data['data'].length; i++) {
            print(data['data'][i]);
            favorite.add(FavoriteModel(
                data['data'][i]['id'], data['data'][i]['project_id']));
          }
        }
      }
      return jsonDecode(re.body)['status'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  addFavorite(item) async {
    var re;
    var data;
    try {
      re = await http.post(
          '$url/api/add_fovrite?user_id=${user.id}&project_id=${item.id}');
      data = jsonDecode(re.body);
      if (data['status']) {
        favorite
            .add(FavoriteModel(data['data']['id'], data['data']['project_id']));
      }
      return jsonDecode(re.body)['status'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  checkFavoirte(Item item) {
    for (var pro in favorite) {
      if (item.id == int.parse(pro.projectId)) {
        print('favorite');
        return true;
      }
      return false;
    }
    return false;
  }

  deleteFavorite(item) async {
    var re;
    var data;

    for (int i = 0; i < favorite.length; i++) {
      favorite.removeAt(i);

      if (item.id.toString() == favorite[i].projectId) {
        try {
          print(favorite[i].id);
          re = await http.post('$url/api/delete_fovrite/${favorite[i].id}');
          print(favorite[i].id);
          data = jsonDecode(re.body);
          print(jsonDecode(re.body));
        } catch (e) {
          print(e);
        }
        print(favorite.length);

        return true;
      }
      return false;
    }
  }

  changelang(Locale locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (locale.languageCode == 'en') {
      projects = _projects_en;
      preferences.setString('lang', 'en');
    } else {
      projects = _projects_ar;
      preferences.setString('lang', 'ar');
    }
  }

  checklang() async {
    AppModel model = AppModel();
    Locale re = await model.checkLang();
    print(re);
    if (re.languageCode == 'en') {
      projects = _projects_en;
    } else {
      projects = _projects_ar;
    }
  }

  download(file) {}
}

final bloc = _Bloc();
