import 'package:hotel_app/features/Auth/Domain/Entities/user_entity.dart';

class UserModel {
  final String email;
  final String userName;

  UserModel({required this.email, required this.userName});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(email: email, userName: userName);
  }
}
