import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? username;
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  User({this.id, this.username, this.email, this.created, this.updated});

  // 통신을 위해서 json처럼 생긴 문자열 => Dart 오브젝트로 변경
  User.fromJson(Map<String, dynamic> json) // 이름 있는 생성자
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        created = DateFormat("yyyy-mm-dd").parse(json["created"]), // DateFromat 라이브러리 추가!
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}
