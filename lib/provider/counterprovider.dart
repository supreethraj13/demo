import 'package:flutter/material.dart';

class Counterprovider extends ChangeNotifier {
  Counterprovider();
  int counter=0;


  void Increment(){
    counter++;
    notifyListeners();
  }

 
}