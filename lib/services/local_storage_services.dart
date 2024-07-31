import 'package:localstore/localstore.dart';
import 'package:tapcard/controllers/home_controller.dart';

class LocalStorageService {
  static final Localstore _storageService = Localstore.instance;
  static LocalStorageService get instance => LocalStorageService._internal();

  static CollectionRef themeRef = _storageService.collection('themeRef');
  static CollectionRef myCards = _storageService.collection('myCards');
  static CollectionRef othersCards = _storageService.collection('othersCards');

  saveThemeValue(String val) async {
    await themeRef.doc('themeRef').set({"theme": val}).then((value) {
      print('value saved');
    }).catchError((err) {
      print('Error caught while saving data to localstore,$err');
    });
  }

  Future<String> getThemeVal() async {
    final corDoc = themeRef.doc('themeRef');
    final r = await corDoc.get();
    return r == null ? 'light' : r.values.firstOrNull;
  }

  saveMyCards(Map<String, dynamic> cardDoc) {
    myCards.doc(cardDoc['id'].toString()).set(cardDoc).then((value) {
      print('doc saved to local:$value');
    }).catchError((err) {
      print('Error caught while saving data to firestore,$err');
    });
  }
  saveOthersCards (Map<String, dynamic> cardDoc) {
    othersCards.doc(cardDoc['id'].toString()).set(cardDoc).then((value) {
      print('doc saved to local:$value');
    }).catchError((err) {
      print('Error caught while saving data to firestore,$err');
    });
  }

  void updateMyCard(Map<String, dynamic> updatedCardDoc) {
    myCards
        .doc(updatedCardDoc['id'].toString())
        .set(updatedCardDoc, SetOptions(merge: true))
        .then((value) {
      print('doc updated in local: $value');
    }).catchError((err) {
      print('Error caught while updating data in localstore: $err');
    });
  }

  Future getMyCards() async {
    final notes = await myCards.get();
    return notes?.values.toList();
  }

  Future getOthersCards() async {
    final notes = await othersCards.get();
    return notes?.values.toList();
  }

  void deleteMyCard(String id){
    myCards.doc(id).delete();
    HomeController.it.update();
  }

  void clearMyCards(){

    myCards.delete();
  }

  LocalStorageService._internal();
}
