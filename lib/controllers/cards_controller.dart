import 'dart:ui';

import 'package:get/get.dart';
// import 'dart:convert';

class CardsController extends GetxController {
  final cards = <BusinessCard>[].obs;
  final isSharing = false.obs;
  final isSharingSuccess = false.obs;
  //final storage = GetStorage();


  void loadCards() {
    final storedCards =
       // storage.read<List>('cards') ??
            [];
    cards.value =
        storedCards.map((card) => BusinessCard.fromJson(card)).toList();
  }

  void saveCards() {
 //   storage.write('cards', cards.map((card) => card.toJson()).toList());
  }

  void addCard(BusinessCard card) {
    cards.add(card);
    saveCards();
  }

  void updateCard(int index, BusinessCard updatedCard) {
    cards[index] = updatedCard;
    saveCards();
  }

  void deleteCard(int index) {
    cards.removeAt(index);
    saveCards();
  }

  void shareCard(BusinessCard card) {
    isSharing.value = true;
    // Simulating sharing process
    Future.delayed(const Duration(seconds: 2), () {
      isSharing.value = false;
      isSharingSuccess.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isSharingSuccess.value = false;
      });
    });
  }

  void editCard(BusinessCard card) {
    // Implement editing logic
  }
}

class BusinessCard {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String website;
  final Color color;

  BusinessCard({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.website,
    required this.color,
  });

  factory BusinessCard.fromJson(Map<String, dynamic> json) {
    return BusinessCard(
      name: json['name'],
      title: json['title'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      color: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'email': email,
      'phone': phone,
      'website': website,
      'color': color.value,
    };
  }
}
