
class PostApiRes {
  final int? id;
  final String? title;
  final String? body;
  final int? userId;

  PostApiRes({this.body, this.id, this.title, this.userId});
  factory PostApiRes.fromJson(Map<String, dynamic> json) {
    return PostApiRes(body: json["body"], id: json["id"], title: json["title"], userId: json["userId"]);
  }
}