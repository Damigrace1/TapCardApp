import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localstore/localstore.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:tapcard/views/edit_card.dart';
// import 'package:tapcard/views/widgets/card2__widget.dart';
import '../custom_button.dart';
import '../model/nfc_service_model.dart';
import '../services/local_storage_services.dart';

class HomeController extends GetxController {
  static HomeController get it => Get.find();

  @override
  void onInit() async {
    super.onInit();
    String mode = await LocalStorageService.instance.getThemeVal();
    themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    fetchCardsFromDatabase();
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

  Future<void> shareBusinessCard(BusinessCardModel card) async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        print('NFC is not available on this device');
        return;
      }

      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        try {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            print('Tag is not NDEF compatible');
            return;
          }

          NdefMessage message = NdefMessage([
            NdefRecord.createText(jsonEncode(card.toJson())),
          ]);

          await ndef.write(message);
          print('Card data written successfully');
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

      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        try {
          Ndef? ndef = Ndef.from(tag);
          if (ndef == null) {
            print('Tag is not NDEF compatible');
            return;
          }

          NdefMessage? message = await ndef.read();
          if (message == null) {
            print('No NDEF message found on the tag');
            return;
          }

          for (NdefRecord record in message.records) {
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
                record.type.elementAt(0) == 0x54) {
              // 'T' for Text
              String payload = String.fromCharCodes(record.payload.sublist(3));
              print('NFC Tag Read: $payload');

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

  void showEditCardDialog(BuildContext context) {
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
              Get.to(() => EditCard());
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
              // Handle customize card
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
              // Handle delete
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
          )
        ],
      ),
    ));
  }
}
