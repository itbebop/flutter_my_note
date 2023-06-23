import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body){ // body는 _InternallinkedHashMap 타입?

  //jsonDecode(utf8.decode(body.codeUnits));
  // 위와 같이 쓰고 싶은데 body는 json문자열 타입으로 codeUnits를 바로 쓸 수가 없음

  String responseBody = jsonEncode(body); // 그래서 String으로 바꿔서 codeUnits 붙여서 인코딩
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits)); //
  return convertBody;
}