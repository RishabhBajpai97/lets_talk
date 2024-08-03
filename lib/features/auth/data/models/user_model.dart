import 'package:lets_talk/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.username, required super.userId});
  factory UserModel.fromJson(dynamic json) {
    return UserModel(username: json["username"], userId: json["id"]);
  }
  @override
  String toString() {
    return "User(username:$username, userId:$userId)";
  }
}
