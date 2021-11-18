import 'package:flutter/material.dart';

class providers with ChangeNotifier {
  int _hight = 0;
  int _wiegth = 10;
  int _age = 10;
  bool _gender = true;

  providers(this._hight, this._wiegth, this._age, this._gender);

  gethight() => _hight;

  sethight(int hight) => _hight = hight;

  getweight() => _wiegth;

  setweight(int weight) => _wiegth = weight;

  getgender() => _gender;

  setgender(bool gender) => _gender = gender;

  getage() => _age;

  setage(int age) => _age = age;

  void increase_height() {
    _hight++;
    notifyListeners();
  }

  void decrease_hight() {
    _hight--;
    notifyListeners();
  }

  void increase_weight() {
    _wiegth++;
    notifyListeners();
  }

  void decrease_weight() {
    _wiegth--;
    notifyListeners();
  }

  void change_gender() {
    _gender = false;
    notifyListeners();
  }

  void increase_age() {
    _age++;
    notifyListeners();
  }

  void decrease_age() {
    _age--;
    notifyListeners();
  }
}
