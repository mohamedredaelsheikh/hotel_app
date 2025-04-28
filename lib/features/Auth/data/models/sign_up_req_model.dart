class SignUpReqModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpReqModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() => {
    'userName': userName,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
  };
}
