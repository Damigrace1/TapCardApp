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
  String? linkedln;
  String? twitter;
  DateTime? dateTime;

  BusinessCardModel(
      {this.id,
      this.color,
      this.name,
      this.jobTitle,
      this.website,
      this.email,
      this.phoneNumber,
      this.company,
      this.twitter,
      this.linkedln,
      this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'color': color?.value,
      'dateTime': dateTime.toString(),
      'name': name,
      'id': id,
      'jobTitle': jobTitle,
      'website': website,
      'email': email,
      'company': company,
      'phoneNumber': phoneNumber,
      'twitter': twitter,
      'linkedln': linkedln
    };
  }

  // Method to create a BusinessCard from a Map (useful for deserialization)
  factory BusinessCardModel.fromMap(Map<String, dynamic> map) {
    return BusinessCardModel(
        color: map['color'] != null ? Color(map['color']) : null,
        name: map['name'],
        id: map['id'],
        dateTime: map['dateTime'] != null ? DateTime.parse(map['dateTime']) : null ,
        jobTitle: map['jobTitle'],
        website: map['website'],
        email: map['email'],
        company: map['company'],
        phoneNumber: map['phoneNumber'],
        linkedln: map['linkedln'],
        twitter: map['twitter']);
  }

  @override
  String toString() {
    return 'BusinessCard(color: $color, name: $name, jobTitle: $jobTitle, '
        'website: $website, email: $email,'
        'company : $company'
        ' phoneNumber: $phoneNumber) ';
  }
}
