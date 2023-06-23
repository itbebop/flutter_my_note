
import 'package:get/get.dart';

import '../../controller/dto/response_dto.dart';
import '../../controller/dto/save_or_update_request_dto.dart';
import 'post.dart';
import 'post_provider.dart';



// 통신 호출해서 응답받은 데이터를 가공(각 유형(user/post등)->Json->Dart오브젝트)
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> save(String title, String content) async{ // UserRepository body 넘기는 거 참고
    SaveOrUpdateReqDto saveReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.save(saveReqDto.toJson());
    dynamic body = response.body;
    // 인코딩
    RespDto respDto = RespDto.fromJson(body);
    print("코드가 무엇? : ${respDto.code}");
    if (respDto.code == 1) {
      print("글쓰기 성공");
      Post post = Post.fromJson(respDto.data);
      return post;
    } else {
      print("글쓰기 실패");
      return Post(); // 빈 Post 리턴
    }
  }

  Future<Post> updateById(int id, String title, String content) async{ // UserRepository body 넘기는 거 참고
    SaveOrUpdateReqDto updateReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    // 인코딩
    RespDto cmRespDto = RespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print("수정 성공");
      Post post =Post.fromJson(cmRespDto.data);
      return post;
    } else {
      print("수정 실패");
      return Post(); // 빈 Post 리턴
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    // 인코딩
    RespDto respDto = RespDto.fromJson(body);

    return respDto.code ?? -1; // code가 null이면 -1을 넣는다
    //return cmRespDto.code! // 무조건 있으니깐 이렇게 해도됨
  }

  Future<Post> findById(int id) async { // Future와 async는 세트
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    //dynamic convertBody = convertUtf8ToObject(body);
    // 인코딩
    RespDto respDto = RespDto.fromJson(body);

    if (respDto.code == 1) {
      Post post = Post.fromJson(respDto.data); // 한건이라 list로 바꿔줄 필요 없음
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    // print(convertUtf8ToObject(body)); 에러남. 나중에 잡을 것
    //dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결

    RespDto respDto = RespDto.fromJson(body);

    if (respDto.code == 1) { // 통신성공
      List<dynamic> temp = respDto.data; // map으로 받으려는데 dynamic타입이라서 컴파일될 때 받을 타입을 알 수 있고 지금은 data.map을 쓰지 못함
      // 그래서 일단 위에서 임시로 temp에 받고
      // 아래서 map타입으로 변환한 걸 dart obeject로 변환 => List형식으로
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();

      return posts;
    } else {
      // List<Post> p = [];
      // return p;
      return <Post>[]; // 빈 배열 리턴(위보다 간편)
    }
  }
}