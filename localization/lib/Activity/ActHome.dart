import 'package:flutter/material.dart';
import 'package:localization_2/Activity/ActSetting.dart';
import 'package:localization_2/Utils/Constant.dart';

class ActHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ActHomeState();
  }

}

class ActHomeState extends State<ActHome> with Constant{
  @override
  Widget build(BuildContext context) {
    setConstantContext(context);
    return Scaffold(
      appBar: AppBar(
        title: new Text(setMultiLang(titleHome)),

        actions: <Widget>[
          IconButton(
            
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return ActSetting();
                }
              ));
            },

            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ), 
        
          ),
        ],
      ),

      body: new Container(
        child: Align(
          alignment: Alignment.center,
          child: new Column(
            children: <Widget>[
                new Text(setMultiLang(strWelcomeTitle,), style: TextStyle(fontSize: 30.0),),
            ],
          )
        ),
      ),
    );
  }

}