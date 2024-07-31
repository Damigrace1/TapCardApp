import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/cards_controller.dart';
import '../widgets/card_widget/add_new_card.dart';
import '../widgets/card_widget/card_form.dart';
import '../widgets/card_widget/card_item.dart';
import '../widgets/card_widget/share_overlay.dart';
import '../widgets/card_widget/success_dialog.dart';

class CardsView extends GetView<CardsController> {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cards',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Obx(() => ListView.builder(
                itemCount: Get.put(CardsController()).cards.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.cards.length) {
                    return AddNewCard(onTap: () => _showCardForm(context));
                  }
                  return CardItem(card: controller.cards[index], index: index);
                },
              )),
          Obx(() => Get.put(CardsController()).isSharing.value
              ? const ShareOverlay()
              : const SizedBox()),
          Obx(() => Get.put(CardsController()).isSharingSuccess.value
              ? const SuccessDialog()
              : const SizedBox()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Cards'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 1,
        onTap: (index) {
          // Implement navigation logic
        },
      ),
    );
  }

  void _showCardForm(BuildContext context, {BusinessCard? card, int? index}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CardForm(
        card: card,
        onSave: (newCard) {
          if (index != null) {
            controller.updateCard(index, newCard);
          } else {
            controller.addCard(newCard);
          }
          Get.back();
        },
      ),
    );
  }
}
