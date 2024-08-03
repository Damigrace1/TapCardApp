import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
import 'package:tapcard/views/widgets/dialogs/received_card.dart';
import 'package:tapcard/views/widgets/dialogs/scan_incoming_card.dart';
// import 'package:tapcard/views/widgets/card2__widget.dart';
import '../custom_button.dart';
import '../model/nfc_service_model.dart';
import '../services/local_storage_services.dart';
import '../views/widgets/dialogs/sharing_complete.dart';
import '../views/widgets/dialogs/start_sharing.dart';

class HomeController extends GetxController {
  static HomeController get it => Get.find();
  RxInt pickerColor = 4293467747.obs;
  List myCards = [];

  getMyCards() async {
    myCards = await LocalStorageService.instance.getMyCards() ?? [];
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    String mode = await LocalStorageService.instance.getThemeVal();
    themeMode = mode == 'dark' ? ThemeMode.dark : ThemeMode.light;
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

  void showEditCardDialog(
      BuildContext context, bm.BusinessCardModel cardModel) {
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
              Get.to(() => EditCard(
                    cardModel: cardModel,
                  ));
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
              Navigator.pop(context);
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
              LocalStorageService.instance
                  .deleteMyCard(cardModel.id.toString());
              HomeController.it.getMyCards();
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
              },
            ),
          ),
        ],
      ),
    ));
  }

  var businessCards = <BusinessCardModel>[].obs;

  // Future<void> shareBusinessCard(bm.BusinessCardModel card) async {
  //   try {
  //     bool isAvailable = await NfcManager.instance.isAvailable();
  //     if (!isAvailable) {
  //       Get.snackbar('Error', 'NFC is not available on this device');
  //       return;
  //     }
  //     showDialog(
  //       context: Get.context!,
  //       builder: (context) => const StartSharing(),
  //     );
  //     NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
  //       try {
  //         Ndef? ndef = Ndef.from(tag);
  //         if (ndef == null) {
  //           Get.snackbar('Device Error', 'Tag is not NDEF compatible');
  //           return;
  //         }

  //         NdefMessage message = NdefMessage([
  //           NdefRecord.createText(jsonEncode(card.toMap())),
  //         ]);

  //         await ndef.write(message);
  //         Navigator.pop(Get.context!);
  //         // Get.snackbar('Write Success ' , 'Card data written successfully');

  //         showDialog(
  //           context: Get.context!,
  //           builder: (context) => const SharingComplete(),
  //         );
  //         NfcManager.instance.stopSession();
  //       } catch (e) {
  //         print('Error writing to NFC tag: $e');
  //         NfcManager.instance.stopSession(errorMessage: e.toString());
  //       }
  //     });
  //   } catch (e) {
  //     print('Error starting NFC session: $e');
  //   }
  // }

  // Added this here
  Future<void> shareBusinessCard(bm.BusinessCardModel card) async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        Get.snackbar('Error', 'NFC is not available on this device');
        return;
      }
      showDialog(
        context: Get.context!,
        builder: (context) => const StartSharing(),
      );
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        print('Discovered NFC tag');
        try {
          Ndef? ndef = Ndef.from(tag);
          if (ndef != null) {
            // NDEF compatible device
            NdefMessage message = NdefMessage([
              NdefRecord.createText(jsonEncode(card.toMap())),
            ]);
            await ndef.write(message);
          } else {
            // Non-NDEF device, try Android Beam or HCE
            if (Platform.isAndroid) {
              await shareViaAndroidBeam(card);
            } else {
              // For iOS or other platforms, you might need a different approach
              Get.snackbar('Error', 'Unsupported device for non-NDEF sharing');
            }
          }
          Navigator.pop(Get.context!);
          showDialog(
            context: Get.context!,
            builder: (context) => const SharingComplete(),
          );
        } catch (e) {
          print('Error sharing card: $e');
          Get.snackbar('Error', 'Failed to share card: $e');
        } finally {
          NfcManager.instance.stopSession();
        }
      });
    } catch (e) {
      print('Error starting NFC session: $e');
      Get.snackbar('Error', 'Failed to start NFC session: $e');
    }
  }

  Future<bm.BusinessCardModel?> readBusinessCard() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        Get.snackbar('Sorry', 'NFC is not available on this device');
        return null;
      }
      showDialog(
          context: Get.context!, builder: (context) => ScanIncomingCard());
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        print('Discovered NFC tag');
        try {
          Ndef? ndef = Ndef.from(tag);

          if (ndef == null) {
            Navigator.pop(Get.context!);
            Get.snackbar('Device Error', 'Tag is not NDEF compatible');
            return;
          }

          NdefMessage? message = await ndef.read();
          // Get.snackbar('NFC data', message.toString());
          if (message == null) {
            Navigator.pop(Get.context!);
            Get.snackbar('OOps', 'No NDEF message found on the tag');
            return;
          }

          for (NdefRecord record in message.records) {
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
                record.type.elementAt(0) == 0x54) {
              // 'T' for Text
              String payload = String.fromCharCodes(record.payload.sublist(3));

              try {
                bm.BusinessCardModel card =
                    bm.BusinessCardModel.fromMap(jsonDecode(payload));
                Navigator.pop(Get.context!);
                showDialog(
                  context: Get.context!,
                  builder: (context) => ReceivedCard(
                    businessCardModel: card,
                  ),
                );
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
      return null;
    }
    return null;
  }

  Future<void> shareViaAndroidBeam(bm.BusinessCardModel card) async {
    try {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          Get.snackbar('Error', 'Tag is not NDEF compatible');
          return;
        }

        NdefMessage message = NdefMessage([
          NdefRecord.createMime(
            'application/vnd.com.example.businesscard',
            Uint8List.fromList(jsonEncode(card.toMap()).codeUnits),
          ),
        ]);

        try {
          ndef.isWritable;
          Get.snackbar('Success', 'Card shared successfully');
        } catch (e) {
          Get.snackbar('Error', 'Failed to share card: $e');
        } finally {
          NfcManager.instance.stopSession();
        }
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to start NFC session: $e');
    }
  }
}
