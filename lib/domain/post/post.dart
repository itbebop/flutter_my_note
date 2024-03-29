import 'package:intl/intl.dart';

import '../user/user.dart';

class Post {
  final int? id;
  final String? content;
  final User? user;
  final DateTime? created;
  final DateTime? updated;

  Post(
      {this.id,
        this.content,
        this.user,
        this.created,
        this.updated});

  // 통신을 위해서 json처럼 생긴 문자열 => Dart 오브젝트로 변경
  Post.fromJson(Map<String, dynamic> json) // 이름 있는 생성자
      : id = json["id"],
        content = json["content"],
        user = User.fromJson(json["user"]),
        created = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
}