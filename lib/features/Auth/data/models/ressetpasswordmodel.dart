class Ressetpasswordmodel {
  final String? newPassword;
  final String? confirmPassword;
  final String? email;
  final String? token;

  Ressetpasswordmodel({
    required this.newPassword,
    required this.confirmPassword,
    required this.email,
    required this.token,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token': token,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }

  factory Ressetpasswordmodel.fromJson(Map<String, dynamic> json) {
    return Ressetpasswordmodel(
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'newPassword': newPassword,
    'confirmPassword': confirmPassword,
    'email': email,
    'token': token,
  };
}
