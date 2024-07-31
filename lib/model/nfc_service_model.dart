import 'dart:convert';

class BusinessCardModel {
  final String name;
  final String? jobTitle;
  final String? website;
  final String? email;
  final String phoneNumber;

  BusinessCardModel({
    required this.name,
    this.jobTitle,
    this.website,
    this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'jobTitle': jobTitle,
        'website': website,
        'email': email,
        'phoneNumber': phoneNumber,
      };

  factory BusinessCardModel.fromJson(Map<String, dynamic> json) {
    return BusinessCardModel(
      name: json['name'],
      jobTitle: json['jobTitle'],
      website: json['website'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
