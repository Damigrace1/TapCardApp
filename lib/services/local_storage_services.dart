import 'package:localstore/localstore.dart';

class LocalStorageService {
  static final Localstore _storageService = Localstore.instance;
  static LocalStorageService get instance => LocalStorageService._internal();

  static CollectionRef themeRef = _storageService.collection('themeRef');
  static CollectionRef cardcolor = _storageService.collection('cardcolor');

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

  saveColorValue(String val) async {
    await cardcolor.doc('cardcolor').set({"color": val}).then((value) {
      print('value saved');
    }).catchError((err) {
      print('Error caught while saving data to localstore,$err');
    });
  }

  Future<String> getColorVal() async {
    final corDoc = cardcolor.doc('cardcolor');
    final r = await corDoc.get();
    print('get color ${r?.values.first}');
    return r == null ? 'ff607d8b' : r.values.firstOrNull;
  }

  LocalStorageService._internal();
}
