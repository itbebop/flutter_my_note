
import 'package:get/get.dart';

import '../domain/post/post.dart';
import '../domain/post/post_repository.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() { // 초기화 함수
    super.onInit();
    findAll(); // Homepage에서 Post_Controller가 put될 때 findAll이 실행되어 데이터를 가져옴
    //Post_controller가 put 될때, create, initiate 됨
  }
  Future<void> save(String title, String content) async {
    Post post = await _postRepository.save(title, content);
    print("post의 id는?? ${post.id}");
    if(post.id != null){
      posts.add(post); // 컬렉션에서는 posts.value 추가 안해도 됨
    }
  }
  Future<void> updateById(int id, String title, String content) async {
    Post post = await _postRepository.updateById(id, title, content);
    if(post.id != null){
      this.post.value = post; // 값이 바뀌면 Detail 페이지에서 Obx로 관찰하고 있다가 바로 변경해줌(상태관리)
      // Homapage 목록에서도 title 바뀌게 하려면 Homapage에서도 값 바꿔줘야함
      posts.value = posts.map((e) => e.id == id ? post : e).toList(); // map을 쓴 이유는 돌면서 수정한 id와 같은 것들을 title 덮어씌워줄 것
      // 즉, posts에 map을 돌려서 한바퀴 돌때마다 e에 담는데 수정한 id와 id가 같으면 돌려받은 post로 덮어씌우고 아니면 원래 e를 넣으라는 것
      // 수정된 것만 받는 경우에는 title, content로 전개연산자?(3항 연산자) 써서 바꾼 부분만 변경해줘야하는데, 여기서는 통으로 받으므로 이렇게 쓰면 됨
      // ㄴ 스프레드 연산(깊은복사 등) 13:40 참고
      // 화면 바꿔야할 때(동기화 필요할 때)는 이렇게 값을 바꿔주고, login 같이 안 바꿔도 되는 경우에는 응답만 하면 됨(user controller 참고)
      // temp = post.value.mpa 이렇게 써도 되는데, list는 value 안넣어줘도 됨
    }
  }
  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);

    if (result == 1) {
      print("서버 삭제 성공"); // 여기까지 오면 이미 서버에서 삭제는 된 거고
      // 목록에서 갱신시켜줌
      List<Post> result = posts.where((post) => post.id != id).toList(); // post의 아이디 중 파라미터로 받은 아이디와 다른 것만 result에 리스트형태로 담음
      // posts.where : 필터, id로 찾아줌
      // print("삭제 후 게시글의 수 : ${result.length}");
      posts.value = result; // posts에 덮어씌움
    }
  }

  Future<void> findAll() async {
    //_postRepository.findAll();
    List<Post> posts = await _postRepository.findAll(); // 통신이 끝나서 다운로드가 다되면
    this.posts.value = posts; // 여기에 담김 -> 담기는 것을 관찰할 Obx 함수는 HomePage에 35행 부분
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post; // 여기서 this.post는 전역변수로 선언한 post, 뒤의 post는 상단의 post
    // 즉, repository에서 받아온 post를 controller에서 선언한 post에?? post.dart에?? 넣는 것?
  }
}
