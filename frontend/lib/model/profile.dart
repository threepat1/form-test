import 'package:form_test/model/gender.dart';

class Profile {
  final String email;
  final Gender gender;
  final String pincode;
  final String address;
  final String city;
  final String state;
  final String country;
  final String accountNo;
  final String accountHolder;
  final String ifscCode;

  Profile({
    required this.email,
    required this.gender,
    required this.pincode,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.accountNo,
    required this.accountHolder,
    required this.ifscCode,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      gender: GenderExtension.fromName(json['gender']),
      pincode: json['pincode'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      accountNo: json['accountNo'],
      accountHolder: json['accountHolder'],
      ifscCode: json['ifsccode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'gender': gender,
      'pincode': pincode,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'accountNo': accountNo,
      'accountHolder': accountHolder,
      'ifsccode': ifscCode,
    };
  }
}
