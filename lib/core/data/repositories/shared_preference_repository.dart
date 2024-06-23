import 'dart:convert';

import 'package:auto/core/data/models/apis/auth_model.dart';
import 'package:auto/core/enums/data_type.dart';
import 'package:auto/core/utils/general_util.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepository {
  SharedPreferences globalSharedPrefs = Get.find();
  String prefFirstLanch = 'first_lanuch';
  String prefTokenInfo = 'token_info';
  String prefAppLang = 'app_language';
  String prefUer ='user';
 

  static void clearStorage() {
    storage.setTokenInfo('');
    storage.setUser(UserData());
    storage.setFirstLanuch(true);
  }

  setTokenInfo(String value) {
    setPreferance(
      dataType: DataType.string,
      key: prefTokenInfo,
      value: value,
    );
  }

  String? getTokenInfo() {
    if (globalSharedPrefs.containsKey(prefTokenInfo)) {
      return getPrefrance(key: prefTokenInfo);
    } else {
      return null;
    }
  }


  setFirstLanuch(bool value) {
    setPreferance(
      dataType: DataType.bool,
      key: prefFirstLanch,
      value: value,
    );
  }

  bool getFirstLanuch() {
    if (globalSharedPrefs.containsKey(prefFirstLanch)) {
      return getPrefrance(key: prefFirstLanch);
    } else {
      return true;
    }
  }

  setAppLanguage(String value) {
    setPreferance(
      dataType: DataType.string,
      key: prefAppLang,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPrefs.containsKey(prefAppLang)) {
      return getPrefrance(key: prefAppLang);
    } else {
      return 'en';
    }
  }

 setUser(UserData value) {
    setPreferance(
      dataType: DataType.string,
      key: prefUer,
      value: jsonEncode(value),
    );
  }

  UserData getUser() {
    if (globalSharedPrefs.containsKey(prefUer)) {
      return UserData.fromJson(jsonDecode(getPrefrance(key: prefUer))) ;
    } else {
      return UserData();
    }
  }
  

  setPreferance({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.int:
        await globalSharedPrefs.setInt(key, value);
        break;
      case DataType.bool:
        await globalSharedPrefs.setBool(key, value);
        break;
      case DataType.string:
        await globalSharedPrefs.setString(key, value);
        break;
      case DataType.double:
        await globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.listString:
        await globalSharedPrefs.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrance({required String key}) {
    return globalSharedPrefs.get(key);
  }
}
