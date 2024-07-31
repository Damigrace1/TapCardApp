import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:tapcard/models/business_model.dart' as bm;
import 'package:tapcard/utils/const.dart';
import 'package:tapcard/views/customize/cardcustom.dart';
import 'package:localstore/localstore.dart';
import 'package:nfc_manager/nfc_manager.dart';


import 'package:tapcard/views/edit_card.dart';
// import 'package:tapcard/views/widgets/card2__widget.dart';
import '../custom_button.dart';
import '../model/nfc_service_model.dart';
import '../services/local_storage_services.dart';

class HomeController extends GetxController {
  static HomeController get it => Get.find();
  RxInt pickerColor = 4293467747.obs;
  List myCards = [];

  getCards() async {
    myCards = await LocalStorageService.instance.getMyCards()??[];
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    String mode = await LocalStorageService.instance.getThemeVal();
    themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    readNfcTag();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode val) {
    String mode = val == ThemeMode.dark ? 'dark' : 'light';
    LocalStorageService.instance.saveThemeValue(mode);
    _themeMode = val;
    update();
  }

  ThemeData _themeData = ThemeData.light();
  ThemeData get theme => _themeData;
  set theme(ThemeData val) {
    _themeData = val;
    update();
  }


  void showEditCardDialog(BuildContext context, bm.BusinessCardModel cardModel) {

    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Edit Card',
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/edit.png',
              width: 18.5.w,
            ),
            title: Text('Change Details'),
            onTap: () {
              Navigator.pop(context);
              Get.to(() => EditCard(cardModel: cardModel,));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/palette.png',
              width: 18.5.w,
            ),
            title: Text('Customize Card'),
            onTap: () {
              Get.to(() => CustomCard(business: cardModel));
            },
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              'assets/icons/delete.png',
              width: 18.5.w,
            ),
            title: Text('Delete'),
            onTap: () {
              LocalStorageService.instance.deleteCard(cardModel.id.toString());
              HomeController.it.getCards();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                text: 'Close',
                filled: false,
                onPressed: () {
                  Navigator.pop(context);
                }),
            // child: CustomButton(
            //     text: 'Close',
            //     filled: false,
            //     onPressed: () {
            //       Navigator.pop(context);
            //     }),
          )
        ],
      ),
    ));

  }

  var businessCards = <BusinessCardModel>[].obs;
  final _db = Localstore.instance;

  void fetchCardsFromDatabase() async {
    final items = await _db.collection('businessCards').get();
    if (items != null) {
      businessCards.value =
          items.values.map((item) => BusinessCardModel.fromJson(item)).toList();
    }
  }

  void addBusinessCard(BusinessCardModel card) async {
    final id = _db.collection('businessCards').doc().id;
    await _db.collection('businessCards').doc(id).set(card.toJson());
    businessCards.add(card);
  }

  Future<void> shareBusinessCard(bm.BusinessCardModel card) async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {

        Get.snackbar('Error','NFC is not available on this device');
        return;
      }

      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        try {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            Get.snackbar('Device Error', 'Tag is not NDEF compatible');
            return;
          }

          NdefMessage message = NdefMessage([
            NdefRecord.createText(jsonEncode(card.toMap())),
          ]);

          await ndef.write(message);
          Get.snackbar('Write Success ' , 'Card data written successfully');
          NfcManager.instance.stopSession();
        } catch (e) {
          print('Error writing to NFC tag: $e');
          NfcManager.instance.stopSession(errorMessage: e.toString());
        }
      });
    } catch (e) {
      print('Error starting NFC session: $e');
    }
  }

  Future<void> readNfcTag() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {

        print('NFC is not available on this device');
        return;
      }

      NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async
      {
        Get.snackbar('NFC Read Seesion', 'Connection Discovered',duration: 1.5.seconds);
        try {
          Ndef? ndef = Ndef.from(tag);

          if (ndef == null) {
            print('Tag is not NDEF compatible');
            return;
          }

          NdefMessage? message = await ndef.read();
          Get.snackbar('NFC data', message.toString());
          if (message == null) {
            print('No NDEF message found on the tag');
            return;
          }

          for (NdefRecord record in message.records) {
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
                record.type.elementAt(0) == 0x54) {
              // 'T' for Text
              String payload = String.fromCharCodes(record.payload.sublist(3));
              Get.snackbar('Read success' , 'NFC Tag Read: $payload');

              try {
                BusinessCardModel card =
                    BusinessCardModel.fromJson(jsonDecode(payload));
                addBusinessCard(card);
                print('Business card added to local storage');
              } catch (e) {
                print('Error parsing business card data: $e');
              }
            }
          }

          NfcManager.instance.stopSession();
        } catch (e) {
          print('Error reading NFC tag: $e');
          NfcManager.instance.stopSession(errorMessage: e.toString());
        }
      });
    } catch (e) {
      print('Error starting NFC session: $e');
    }
  }


}
