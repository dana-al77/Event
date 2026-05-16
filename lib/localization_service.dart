/*
import 'dart:convert';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'Package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  late final Locale locale;
  static late Locale currentlocale;

  LocalizationService(this.locale){
    currentlocale = locale;
  }
  static LocalizationService of(BuildContext context){
    return Localizations.of(context,LocalizationService);
  }
  late Map<String,String> _localizedString;

  Future<void> load()async{
    final jsonString= await rootBundle.loadString("lang/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedString= jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
  String? translate(String key){
    return _localizedString[key];
  }
  static const supportedLocales = [
    Locale("en","US"),
    Locale("ar","AR")
  ];

  static Locale? localeResolutionCallBack(Locale? locale,Iterable<Locale>? supportedLocales){
    if(supportedLocales !=null && locale !=null){
      return supportedLocales.firstWhere((element) => element.languageCode==locale.languageCode,
          orElse: ()=> supportedLocales.first);
    }
    return null;
  }


  static const LocalizationsDelegate<LocalizationService> _delegate = _LocalizationServiceDelegate();
  static const localizationDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,

    _LocalizationServiceDelegate(), // إنشاء كائن جديد هنا
  ];




}class _LocalizationServiceDelegate extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService service = LocalizationService(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}



class LocalizationController extends GetxController {
  String currentLanguage = "".obs.toString();

  void toggleLanguage() async {
    String newLanguage = LocalizationService.currentlocale.languageCode == "ar"
        ? "en"
        : "ar";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("appLanguage", newLanguage);
    currentLanguage = newLanguage;
    update();
  }
}
 */