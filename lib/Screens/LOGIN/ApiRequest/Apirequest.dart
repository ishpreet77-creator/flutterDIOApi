class User {
  final String? title;
  final String? body;
  final int? userId;

  User({this.title, this.body, this.userId});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}
