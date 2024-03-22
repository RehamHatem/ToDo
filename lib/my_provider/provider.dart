import 'package:flutter/material.dart';
class MyProvider extends ChangeNotifier{
  String langCode="en";
  ThemeMode mood=ThemeMode.light;
  changeLang(String code){
    langCode=code;
    notifyListeners();
  }
  changemood(ThemeMode mode){
    mood=mode;
    notifyListeners();
  }
  String getBackgroundImagePath(){
    if(mood==ThemeMode.light){
      return"assets/images/default_bg.png";
    }else{
      return"assets/images/dark_bg.png";
    }
  }
}