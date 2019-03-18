import 'package:flutter/material.dart';
import 'package:localization_2/Utils/AppTranslations%20.dart';

class Constant{

  
  /* ------ MultiLanguage start --------- */
  BuildContext context;
  setConstantContext(BuildContext context){
    this.context = context;
  }

  setMultiLang(String strLanguage){
    return AppTranslations.of(context).text(strLanguage);
  }
  /* ------ MultiLanguage end --------- */
  

  String strWelcomeTitle = "Hello Avinash Kahar";
  String sharedPrefLangChange = "sharedPrefLangChange";
  String sharedPrefLangSelected = "sharedPrefLangSelected";
  
  String titleSetting = "Setting";
  String titleHome = "Home";
  
  String langEnglish = "English";
  String langHindi = "Hindi";
  String langGujarati = "Gujarati";
}