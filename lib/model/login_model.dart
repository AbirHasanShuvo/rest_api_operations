class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.error, required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        error: json['token'] != null ? json['token'] : "",
        token: json['token'] != null ? json['token'] : "");
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim()
    };

    return map;
  }
}
