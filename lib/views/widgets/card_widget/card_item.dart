import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cards_controller.dart';
import 'card_form.dart';
// import '../controllers/cards_controller.dart';

class CardItem extends GetView<CardsController> {
  final BusinessCard card;

  const CardItem({super.key, required this.card, required int index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(card.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(card.title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Text(card.email, style: const TextStyle(color: Colors.white)),
          Text(card.phone, style: const TextStyle(color: Colors.white)),
          Text(card.website, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => controller.shareCard(card),
                style: ElevatedButton.styleFrom(
                    foregroundColor: card.color, backgroundColor: Colors.white),
                child: const Text('Share'),
              ),
              ElevatedButton(
                onPressed: () => controller.editCard(card),
                style: ElevatedButton.styleFrom(
                    foregroundColor: card.color, backgroundColor: Colors.white),
                child: const Text('Edit'),
              ),
              // ElevatedButton(
              //   onPressed: () => _confirmDelete(context),
              //   child: Text('Delete'),
              //   style: ElevatedButton.styleFrom(
              //       foregroundColor: card.color, backgroundColor: Colors.white),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditForm(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CardForm(
        card: card,
        onSave: (updatedCard) {
          controller.updateCard(index, updatedCard);
          Get.back();
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Card'),
          content: const Text('Are you sure you want to delete this card?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                controller.deleteCard(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
