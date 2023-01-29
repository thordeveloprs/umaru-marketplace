import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
    if (prefs.containsKey('ff_userData')) {
      try {
        _userData = jsonDecode(prefs.getString('ff_userData') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _imageBaseUrl = prefs.getString('ff_imageBaseUrl') ?? _imageBaseUrl;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool _value) {
    _isLogin = _value;
    prefs.setBool('ff_isLogin', _value);
  }

  dynamic _userData;
  dynamic get userData => _userData;
  set userData(dynamic _value) {
    _userData = _value;
    prefs.setString('ff_userData', jsonEncode(_value));
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
  }

  List<dynamic> _categoryData = [];
  List<dynamic> get categoryData => _categoryData;
  set categoryData(List<dynamic> _value) {
    _categoryData = _value;
  }

  void addToCategoryData(dynamic _value) {
    _categoryData.add(_value);
  }

  void removeFromCategoryData(dynamic _value) {
    _categoryData.remove(_value);
  }

  String _imageBaseUrl =
      'https://staging.umarumart.com/pub/media/catalog/product/';
  String get imageBaseUrl => _imageBaseUrl;
  set imageBaseUrl(String _value) {
    _imageBaseUrl = _value;
    prefs.setString('ff_imageBaseUrl', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
