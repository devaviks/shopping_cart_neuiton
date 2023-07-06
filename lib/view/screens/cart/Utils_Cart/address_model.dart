import 'dart:convert';

class Address {
  String firstName;
  String lastName;
  String email;
  String phone;
  String address;
  String pincode;
  String state;
  String city;
  String toJsonString() {
    return json.encode(toJson());
  }

  Address({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.pincode,
    required this.state,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'pincode': pincode,
      'state': state,
      'city': city,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      pincode: json['pincode'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
    );
  }
}
