import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<double> cartList = [];
  double totalPrice =0.0;
  add(double price){
    cartList.add(price);
    totalPrice+=price;
    notifyListeners();
  }
  remove(double price){
    cartList.remove(price);
    totalPrice-=price;
    notifyListeners();

  }
}