class loginRequest {
  String? userPhone;
  String? otp;

  loginRequest({this.userPhone, this.otp});

  loginRequest.fromJson(Map<String, dynamic> json) {
    userPhone = json['user_phone'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_phone'] = this.userPhone;
    data['otp'] = this.otp;
    return data;
  }
}