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
    if (prefs.containsKey('ff_subscriptionDetail')) {
      try {
        _subscriptionDetail =
            jsonDecode(prefs.getString('ff_subscriptionDetail') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _selectedLanguageCode =
        prefs.getString('ff_selectedLanguageCode') ?? _selectedLanguageCode;
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

  void removeAtIndexFromCategoryData(int _index) {
    _categoryData.removeAt(_index);
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

  void removeAtIndexFromProductUploadImgList(int _index) {
    _productUploadImgList.removeAt(_index);
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

  void removeAtIndexFromCreateProductCountry(int _index) {
    _createProductCountry.removeAt(_index);
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

  void removeAtIndexFromJsonData(int _index) {
    _jsonData.removeAt(_index);
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

  void removeAtIndexFromListCountry(int _index) {
    _listCountry.removeAt(_index);
  }

  int _selectedCountryId = 0;
  int get selectedCountryId => _selectedCountryId;
  set selectedCountryId(int _value) {
    _selectedCountryId = _value;
  }

  String _productStartDate = '';
  String get productStartDate => _productStartDate;
  set productStartDate(String _value) {
    _productStartDate = _value;
  }

  String _productEndDate = '';
  String get productEndDate => _productEndDate;
  set productEndDate(String _value) {
    _productEndDate = _value;
  }

  String _priceDateStart = '';
  String get priceDateStart => _priceDateStart;
  set priceDateStart(String _value) {
    _priceDateStart = _value;
  }

  String _priceDateEnd = '';
  String get priceDateEnd => _priceDateEnd;
  set priceDateEnd(String _value) {
    _priceDateEnd = _value;
  }

  List<String> _selecetCategoryList = [];
  List<String> get selecetCategoryList => _selecetCategoryList;
  set selecetCategoryList(List<String> _value) {
    _selecetCategoryList = _value;
  }

  void addToSelecetCategoryList(String _value) {
    _selecetCategoryList.add(_value);
  }

  void removeFromSelecetCategoryList(String _value) {
    _selecetCategoryList.remove(_value);
  }

  void removeAtIndexFromSelecetCategoryList(int _index) {
    _selecetCategoryList.removeAt(_index);
  }

  dynamic _subscriptionDetail;
  dynamic get subscriptionDetail => _subscriptionDetail;
  set subscriptionDetail(dynamic _value) {
    _subscriptionDetail = _value;
    prefs.setString('ff_subscriptionDetail', jsonEncode(_value));
  }

  String _selectedLanguageCode = 'en';
  String get selectedLanguageCode => _selectedLanguageCode;
  set selectedLanguageCode(String _value) {
    _selectedLanguageCode = _value;
    prefs.setString('ff_selectedLanguageCode', _value);
  }

  String _Informationssurlasocit = 'Informations sur la société';
  String get Informationssurlasocit => _Informationssurlasocit;
  set Informationssurlasocit(String _value) {
    _Informationssurlasocit = _value;
  }

  String _Informationsd039assistance = 'Informations d&#039;assistance';
  String get Informationsd039assistance => _Informationsd039assistance;
  set Informationsd039assistance(String _value) {
    _Informationsd039assistance = _value;
  }

  String _Informationssurlerfrencement = 'Informations sur le référencement';
  String get Informationssurlerfrencement => _Informationssurlerfrencement;
  set Informationssurlerfrencement(String _value) {
    _Informationssurlerfrencement = _value;
  }

  String _Informationsdadresse = 'Informations d’adresse';
  String get Informationsdadresse => _Informationsdadresse;
  set Informationsdadresse(String _value) {
    _Informationsdadresse = _value;
  }

  String _Informationsgnrales = 'Informations générales';
  String get Informationsgnrales => _Informationsgnrales;
  set Informationsgnrales(String _value) {
    _Informationsgnrales = _value;
  }

  List<String> _selectedCategoryIdList = [];
  List<String> get selectedCategoryIdList => _selectedCategoryIdList;
  set selectedCategoryIdList(List<String> _value) {
    _selectedCategoryIdList = _value;
  }

  void addToSelectedCategoryIdList(String _value) {
    _selectedCategoryIdList.add(_value);
  }

  void removeFromSelectedCategoryIdList(String _value) {
    _selectedCategoryIdList.remove(_value);
  }

  void removeAtIndexFromSelectedCategoryIdList(int _index) {
    _selectedCategoryIdList.removeAt(_index);
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
