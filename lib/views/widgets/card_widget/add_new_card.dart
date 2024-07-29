import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tapcard/controllers/cards_controller.dart';

import 'card_form.dart';

class AddNewCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddNewCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () => _showAddCardForm,
      
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: Colors.grey[400]!, style: BorderStyle.solid),
        ),
        child: const Center(
          heightFactor: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_circle_outline,
                  size: 48, color: Color(0xff8e60dd)),
              SizedBox(height: 8),
              Text(
                'Add New Card',
                style: TextStyle(
                  color: Color(0xff8e60dd),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddCardForm(BuildContext context) {
    print('Add new card tapped');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CardForm(
        onSave: (newCard) {
          final controller = Get.find<CardsController>();
          controller.addCard(newCard);
          Get.back();
        },
      ),
    );
  }
}
