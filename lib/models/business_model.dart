import 'package:flutter/material.dart';

class BusinessCardModel {
  Color? color;
  String? name;
  String? jobTitle;
  String? website;
  String? email;
  String? phoneNumber;

  BusinessCardModel({
    this.color,
    this.name,
    this.jobTitle,
    this.website,
    this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color?.value,
      'name': name,
      'jobTitle': jobTitle,
      'website': website,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  // Method to create a BusinessCard from a Map (useful for deserialization)
  factory BusinessCardModel.fromMap(Map<String, dynamic> map) {
    return BusinessCardModel(
      color: map['color'] != null ? Color(map['color']) : null,
      name: map['name'],
      jobTitle: map['jobTitle'],
      website: map['website'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }

  @override
  String toString() {
    return 'BusinessCard(color: $color, name: $name, jobTitle: $jobTitle, website: $website, email: $email, phoneNumber: $phoneNumber)';
  }
}
