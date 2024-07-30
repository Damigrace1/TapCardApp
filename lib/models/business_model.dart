import 'package:flutter/material.dart';

class BusinessCardModel {
  int? id;
  Color? color;
  String? name;
  String? jobTitle;
  String? website;
  String? email;
  String? phoneNumber;
  String? company;

  BusinessCardModel({
    this.id,
    this.color,
    this.name,
    this.jobTitle,
    this.website,
    this.email,
    this.phoneNumber,
    this.company
  });

  Map<String, dynamic> toMap() {
    return {
      'color': color?.value,
      'name': name,
      'id': id,
      'jobTitle': jobTitle,
      'website': website,
      'email': email,
      'company': company,
      'phoneNumber': phoneNumber,
    };
  }

  // Method to create a BusinessCard from a Map (useful for deserialization)
  factory BusinessCardModel.fromMap(Map<String, dynamic> map) {
    return BusinessCardModel(
      color: map['color'] != null ? Color(map['color']) : null,
      name: map['name'],
      id: map['id'],
      jobTitle: map['jobTitle'],
      website: map['website'],
      email: map['email'],
      company: map['company'],
      phoneNumber: map['phoneNumber'],
    );
  }

  @override
  String toString() {
    return 'BusinessCard(color: $color, name: $name, jobTitle: $jobTitle, '
        'website: $website, email: $email,' 'company : $company'
        ' phoneNumber: $phoneNumber) ';
  }
}
