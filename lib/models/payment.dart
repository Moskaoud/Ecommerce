import 'package:flutter/material.dart';

class Payment extends ChangeNotifier {
  String paymentType="none";
  setPaymentType(String type){
    paymentType=type;
    notifyListeners();
  }
}
