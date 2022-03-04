
class AuthResponse {
  bool? success;
  String? message;
 /* ErrorMessage? errorMessage;

  AuthResponse();

  AuthResponse.fromJson(Map<String, dynamic>? json) {
    success = json![status];
    if (success!) {
      message = json[j_message];
    } else {
      if (json[j_message] != null) {
        errorMessage = ErrorMessage();
        errorMessage = ErrorMessage.fromJson(json[j_message]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[status] = this.success;
    data[j_message] = this.message;
    return data;
  }*/
}


