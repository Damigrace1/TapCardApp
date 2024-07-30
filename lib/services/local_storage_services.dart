import 'package:localstore/localstore.dart';

class LocalStorageService {
  static final Localstore _storageService = Localstore.instance;
  static LocalStorageService get instance => LocalStorageService._internal();

  static CollectionRef themeRef = _storageService.collection('themeRef');
  static CollectionRef myCards = _storageService.collection('myCards');



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

  void updateMyCard(Map<String, dynamic> updatedCardDoc) {
    myCards.doc(updatedCardDoc['id'].toString()).
    set (updatedCardDoc,SetOptions(merge:true )).then((value) {
      print('doc updated in local: $value');
    }).catchError((err) {
      print('Error caught while updating data in localstore: $err');
    });
  }
  Future  getMyCards() async {
    final notes = await myCards.get();
    print( notes?.values.toList());
    return notes?.values.toList();

  }
  void deleteCard(String id){

  }
  void clearCards(){
    myCards.delete();
  }
  LocalStorageService._internal();
}
