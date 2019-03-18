import 'package:flutter/material.dart';
import 'package:localization_2/Activity/ActHome.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_2/Utils/AppTranslationsDelegate.dart';
import 'package:localization_2/Utils/Application.dart';
import 'package:localization_2/Utils/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with Constant{

AppTranslationsDelegate _newLocaleDelegate;
  int count = 0;
  bool boolIsLangChange;

 @override
  void initState() {
    super.initState();
    checkSharedPreference();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      //--------------------Localization start--------------------------
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
      //--------------------Localization finish--------------------------

      
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {

        print(" phone languageCode........${locale.languageCode}");
         print(" phone countryCode........${locale.countryCode}");

          if (locale == null) {
            debugPrint("*language locale is null!!!");
            return supportedLocales.first;
          }

          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              debugPrint("*language ok $supportedLocale");
              return supportedLocale;
            }
          }

          debugPrint("*language to fallback ${supportedLocales.first}");
          return supportedLocales.first;
        },

      
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      home: ActHome()
    );
    
  }

  //-- Multi language func
  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
  //-- Multi language func
  checkSharedPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    boolIsLangChange = prefs.getBool(sharedPrefLangChange) ?? false;
    String strLanSelected = prefs.getString(sharedPrefLangSelected);
    print("--> boolIsLangChange: $boolIsLangChange");
    print("--> strLanSelected: $strLanSelected");
     
     if(boolIsLangChange && strLanSelected != null && strLanSelected.length>0){
       setState(() {
        _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale(strLanSelected));
       });

     }
  }
  
}