part of 'bloc.dart';

class PostModel {
  late final List<PostData> postData;

  PostModel.fromJson( json) {
    postData =
        List.from(json).map((e) => PostData.fromJson(e)).toList();
  }
}

class PostData {
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  PostData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
