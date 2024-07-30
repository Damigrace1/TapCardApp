// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:get/get.dart';
// import 'package:localstore/localstore.dart';
// import 'package:ndef/ndef.dart';
// import 'package:ndef/utilities.dart';
// import '../model/nfc_service_model.dart';
// import 'package:ndef/ndef.dart' as ndef;

// class NFCController extends GetxController {
//   final db = Localstore.instance;

//   Future<void> readNFC() async {
//     try {
//       var availability = await FlutterNfcKit.nfcAvailability;
//       if (availability != NFCAvailability.available) {
//         print("NFC is not available");
//         return;
//       }

//       var tag = await FlutterNfcKit.poll(
//         timeout: Duration(seconds: 20),
//         // iosMultipleTagMessage: "Multiple tags found!",
//         // iosAlertMessage: "Scan your tag",
//         androidPlatformSound: GetPlatform.isAndroid,
//         androidCheckNDEF: GetPlatform.isAndroid,
//       );

//       print(jsonEncode(tag));
//       if (tag.type == NFCTagType.iso7816) {
//         var result = await FlutterNfcKit.transceive("00B0950000",
//             timeout: Duration(seconds: 5));
//         print(result);
//       }
//       await FlutterNfcKit.transceive("hi there!");

//       // await FlutterNfcKit.setIosAlertMessage("hi there!");

//       if (tag.ndefAvailable == NFCAvailability.available) {
//         for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
//           print(record.toString());
//           String data = record.payload as String;
//           BusinessCardModel card = BusinessCardModel.fromJson(jsonDecode(data));
//           await db
//               .collection('businessCards')
//               .doc(card.name)
//               .set(card.toJson());
//         }

//         for (var record
//             in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
//           print(jsonEncode(record).toString());
//         }
//       }
//     } catch (e) {
//       print('Error reading NFC: $e');
//     } finally {
//       await FlutterNfcKit.finish();
//     }
//   }

//   Future<void> writeNFC(BusinessCardModel card) async {
//     try {
//       var availability = await FlutterNfcKit.nfcAvailability;
//       if (availability != NFCAvailability.available) {
//         print("NFC is not available");
//         return;
//       }

//       var tag = await FlutterNfcKit.poll(
//         timeout: Duration(seconds: 30), // Increased from 20 to 30 seconds
//         androidPlatformSound: GetPlatform.isAndroid,
//         androidCheckNDEF: GetPlatform.isAndroid,
//       );

//       if (tag == null) {
//         print("No tag detected");
//         return;
//       }

//       if (tag.ndefWritable != true) {
//         print("Tag is not writable");
//         return;
//       }

//       // For testing purposes, you might want to try a simple text record first
//       // Uncomment the following line and comment out the complex write operation
//       await FlutterNfcKit.writeNDEFRecords([ndef.TextRecord(text: "Test NFC Write")]);

//       // If the simple write works, you can then try the full business card data
//       await FlutterNfcKit.writeNDEFRecords(
//           [ndef.TextRecord(text: jsonEncode(card.toJson()))]);

//       print("NFC write successful");
//     } catch (e) {
//       if (e is PlatformException) {
//         print('NFC Error: ${e.code} - ${e.message}');
//       } else {
//         print('Error writing NFC: $e');
//       }
//     } finally {
//       await FlutterNfcKit.finish();
//     }

//     NDEFRecord message = NDEFRecord(
//       // type: 'T',
//       payload: utf8.encode(jsonEncode(card.toJson())),
//     );

//     //   if (tag.ndefWritable == true) {
//     //     await FlutterNfcKit.writeNDEFRecords(
//     //         [ndef.TextRecord(text: jsonEncode(card.toJson()))]);
//     //   }
//     // } catch (e) {
//     //   print('Error writing NFC: $e');
//     // } finally {
//     //   await FlutterNfcKit.finish();
//     // }
//   }

//   Future<void> saveBusinessCardLocally(BusinessCardModel card) async {
//     await db.collection('businessCards').doc(card.name).set(card.toJson());
//   }

//   Future<BusinessCardModel?> getBusinessCard(String name) async {
//     final data = await db.collection('businessCards').doc(name).get();
//     if (data != null) {
//       return BusinessCardModel.fromJson(data);
//     }
//     return null;
//   }
// }

// // Key changes:

// // Increased the polling timeout from 20 to 30 seconds.
// // Added a null check for the tag after polling.
// // Added a check to ensure the tag is writable before attempting to write.
// // Included a commented-out simple write operation for testing purposes.
// // Enhanced error handling to provide more specific error messages, especially for PlatformException.
// // Added a success message print statement.