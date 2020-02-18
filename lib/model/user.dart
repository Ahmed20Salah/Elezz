class User {
  int id;
  String firstName;
  String familyName;
  String email;
  // String mobile;
  // String password;
  String token;

  User.fromMap(Map<String, dynamic> data) {
    this.id = data['id'];
    this.firstName = data['name'];
    this.email = data['email'];
    // this.mobile = data['mobile'];
    // this.password = data['password'];
    this.token = data['access_token'];
  }

  toMap() {
    Map<String, dynamic> map;
    map['firstname'] = this.firstName;
    map['familyname'] = this.familyName;
    map['email'] = this.email;
    // map['mobile'] = this.mobile;
    // map['password'] = this.password;
    return map;
  }
}
