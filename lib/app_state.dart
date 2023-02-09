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
    _findShopCategoryId =
        prefs.getInt('ff_findShopCategoryId') ?? _findShopCategoryId;
    _isEnglish = prefs.getBool('ff_isEnglish') ?? _isEnglish;
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

  int _findShopCategoryId = 9;
  int get findShopCategoryId => _findShopCategoryId;
  set findShopCategoryId(int _value) {
    _findShopCategoryId = _value;
    prefs.setInt('ff_findShopCategoryId', _value);
  }

  List<String> _productUploadImgList = [];
  List<String> get productUploadImgList => _productUploadImgList;
  set productUploadImgList(List<String> _value) {
    _productUploadImgList = _value;
  }

  void addToProductUploadImgList(String _value) {
    _productUploadImgList.add(_value);
  }

  void removeFromProductUploadImgList(String _value) {
    _productUploadImgList.remove(_value);
  }

  List<String> _createProductCountry = [];
  List<String> get createProductCountry => _createProductCountry;
  set createProductCountry(List<String> _value) {
    _createProductCountry = _value;
  }

  void addToCreateProductCountry(String _value) {
    _createProductCountry.add(_value);
  }

  void removeFromCreateProductCountry(String _value) {
    _createProductCountry.remove(_value);
  }

  bool _isConfirm = false;
  bool get isConfirm => _isConfirm;
  set isConfirm(bool _value) {
    _isConfirm = _value;
  }

  String _dialogueMSG = '';
  String get dialogueMSG => _dialogueMSG;
  set dialogueMSG(String _value) {
    _dialogueMSG = _value;
  }

  bool _isEnglish = false;
  bool get isEnglish => _isEnglish;
  set isEnglish(bool _value) {
    _isEnglish = _value;
    prefs.setBool('ff_isEnglish', _value);
  }

  bool _homeProgress = true;
  bool get homeProgress => _homeProgress;
  set homeProgress(bool _value) {
    _homeProgress = _value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  List<dynamic> _jsonData = [];
  List<dynamic> get jsonData => _jsonData;
  set jsonData(List<dynamic> _value) {
    _jsonData = _value;
  }

  void addToJsonData(dynamic _value) {
    _jsonData.add(_value);
  }

  void removeFromJsonData(dynamic _value) {
    _jsonData.remove(_value);
  }

  List<String> _listCountry = ['Mali', 'Senegal', 'Cote d\'ivoire'];
  List<String> get listCountry => _listCountry;
  set listCountry(List<String> _value) {
    _listCountry = _value;
  }

  void addToListCountry(String _value) {
    _listCountry.add(_value);
  }

  void removeFromListCountry(String _value) {
    _listCountry.remove(_value);
  }

  int _selectedCountryId = 0;
  int get selectedCountryId => _selectedCountryId;
  set selectedCountryId(int _value) {
    _selectedCountryId = _value;
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
