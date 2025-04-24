import 'dart:convert';

class SignUpReqModel {
	String? userName;
	String? email;
	String? password;
	String? confirmPassword;

	SignUpReqModel({
		this.userName, 
		this.email, 
		this.password, 
		this.confirmPassword, 
	});

	factory SignUpReqModel.fromMap(Map<String, dynamic> data) {
		return SignUpReqModel(
			userName: data['userName'] as String?,
			email: data['email'] as String?,
			password: data['password'] as String?,
			confirmPassword: data['confirmPassword'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'userName': userName,
				'email': email,
				'password': password,
				'confirmPassword': confirmPassword,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SignUpReqModel].
	factory SignUpReqModel.fromJson(String data) {
		return SignUpReqModel.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SignUpReqModel] to a JSON string.
	String toJson() => json.encode(toMap());
}
