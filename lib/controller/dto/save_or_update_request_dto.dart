class SaveOrUpdateReqDto {
  final String? title;
  final String? content;

  SaveOrUpdateReqDto(this.title, this.content);

  Map<String, dynamic> toJson() => { // MapData를 Json으로?, Post Repository에서 사용
    "title": title,
    "content": content,
  };
}