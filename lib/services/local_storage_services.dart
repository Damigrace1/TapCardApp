
import 'package:localstore/localstore.dart';


class LocalStorageService {
  static final Localstore _storageService = Localstore.instance;
  static LocalStorageService get instance => LocalStorageService._internal();

  static CollectionRef themeRef = _storageService.collection('themeRef');



  saveThemeValue(String val) async {
    await themeRef.doc('themeRef').set({
      "theme":val
    }).then((value) {
      print('value saved');
    }).catchError((err) {
      print('Error caught while saving data to localstore,$err');
    });
  }
  Future <String> getThemeVal() async {
    final corDoc =  themeRef.doc('themeRef');
    final r = await corDoc.get();
    return r == null ?  'light' : r.values.firstOrNull;

  }
  LocalStorageService._internal();
}
