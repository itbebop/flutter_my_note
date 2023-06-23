
class RespDto { // user.dart를 복사해서 만듬
  // Post repository 등 만들면서
  // response 파일의 형식이 user, post(1건, 여러건 (list))로 다양하므로 이 데이터들을 받아서 변환해주기 위한 클래스
  final int? code;
  final String? msg;
  final dynamic data;

  RespDto({this.code, this.msg, this.data});

  RespDto.fromJson(Map<String, dynamic> json) // 이름 있는 생성자
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
