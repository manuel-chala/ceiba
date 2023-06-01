import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  factory Post({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.empty() {
    return Post(
      id: 0,
      userId: 0,
      title: "",
      body: "",
    );
  }

  bool get exists {
    return id != 0;
  }
}
