class UserModel {
  String? name;
  String email;
  String? uid;

  UserModel({this.name, required this.email, this.uid});

  Map<String, dynamic> tojson() {
    return {'name': name, 'email': email, 'uid': uid};
  }

  static UserModel fromJason(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],

      uid: json['uid'],
      name: json['name'],
    );
  }
}
