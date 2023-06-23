import 'package:get/get.dart';

import '../../util/jwt.dart';



const host = "http://192.168.219.125:8080"; // ip
//const host = "http://10.65.81.183:8080"; // ip

// 통신 역할
class PostProvider extends GetConnect {
  Future<Response> findAll() =>
      get("$host/post",
          headers: {"Authorization": jwtToken ?? ""}); // Token을 달고 보내야 데이터 보내줌
// map타입으로 data에 파라미터 날릴 것
// Future는 함수 실행되는데 시간이 좀 걸리므로 바로는 Null이 들어오지만 시간이 좀 걸려서 데이터 들어오면 바꿔줌 (Promise, 데이터 약속)

  Future<Response> findById(int id) =>
      get("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> deleteById(int id) =>
      delete("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> updateById(int id, Map data) =>
      put("$host/post/$id", data, headers: {"Authorization": jwtToken ?? ""});

  // body data를 어떻게 넘기는지 user_provider참고
  // login(Map data) => post --> 이 부분에 hover, data 부분에 hover => 두 번째에 mapdata를 넘겨야함

  Future<Response> save(Map data) =>
      post("$host/post", data, headers: {"Authorization": jwtToken ?? ""});
// api문서 만들어서 참고해야함
// create는 map data만 보내면 됨

}