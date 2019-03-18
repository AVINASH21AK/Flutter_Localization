import 'package:flutter/material.dart';
import 'package:localization_2/Utils/Application.dart';
import 'package:localization_2/Utils/Constant.dart';
import 'package:localization_2/Utils/SharedPref.dart';

class ActSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ActSettingState();
  }
}

class ActSettingState extends State<ActSetting> with Constant{
  

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  @override
  Widget build(BuildContext context) {
    setConstantContext(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text(setMultiLang(titleSetting)),
      ),

      body: new Container(
        color: Colors.brown,
        child: widgetList(),
      ),
    );
  }

  Widget widgetList(){
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (BuildContext context, int index) {
        return listItems(languagesList[index]);
      },
    );
  }

  listItems(String language){
    return InkWell(
      onTap: () {
        SharedPref pref = SharedPref();
        pref.setBool(sharedPrefLangChange, true);
        pref.setString(sharedPrefLangSelected, languagesMap[language]);
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white 
            ),
          ),
        ),
      ),
    );
  }
}