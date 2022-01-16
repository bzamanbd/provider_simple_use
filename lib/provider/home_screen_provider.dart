import 'package:flutter/cupertino.dart';

class HomeScreenProvider extends ChangeNotifier{
  String _message='You didn\'t enter your age yet';
  bool _isEligible=false;
  String get message=>_message;
  bool get isEligible=>_isEligible;

  void eligibilityChecker(int age){
    if (age>=17) {
      //You are eligible
      eligible();
    } else {
      // You are not Eligible

      notEligible();

    }
    
  }
  void eligible() {
    _isEligible = true;
    _message='Your are Eligible';
    notifyListeners();
    
  }

  void notEligible(){
    _isEligible=false;
    _message='You are not Eligible';
    notifyListeners();
  }
} 