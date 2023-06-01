import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() {
    return User(
      id: 0,
      name: "",
      email: "",
      phone: "",
    );
  }

  bool get exists {
    return id != 0;
  }
}
