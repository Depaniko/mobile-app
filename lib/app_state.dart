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
    _tinyfont = prefs.getDouble('ff_tinyfont') ?? _tinyfont;
    _appmode = prefs.getString('ff_appmode') ?? _appmode;
    _ownrocketchatid =
        prefs.getString('ff_ownrocketchatid') ?? _ownrocketchatid;
    _rocketchattoken =
        prefs.getString('ff_rocketchattoken') ?? _rocketchattoken;
    _rocketchatapiendpoint =
        prefs.getString('ff_rocketchatapiendpoint') ?? _rocketchatapiendpoint;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _generaljob = '';
  String get generaljob => _generaljob;
  set generaljob(String _value) {
    _generaljob = _value;
  }

  String _generallocation = 'Paris, 75015';
  String get generallocation => _generallocation;
  set generallocation(String _value) {
    _generallocation = _value;
  }

  List<String> _alljobnames = [
    'Plombier',
    'Charpentier',
    'Electricien',
    'Vitrier',
    'Serrurier',
    'Menuisier',
    'Couvreur'
  ];
  List<String> get alljobnames => _alljobnames;
  set alljobnames(List<String> _value) {
    _alljobnames = _value;
  }

  void addToAlljobnames(String _value) {
    _alljobnames.add(_value);
  }

  void removeFromAlljobnames(String _value) {
    _alljobnames.remove(_value);
  }

  List<String> _keywords = ['Teck'];
  List<String> get keywords => _keywords;
  set keywords(List<String> _value) {
    _keywords = _value;
  }

  void addToKeywords(String _value) {
    _keywords.add(_value);
  }

  void removeFromKeywords(String _value) {
    _keywords.remove(_value);
  }

  bool _pro = false;
  bool get pro => _pro;
  set pro(bool _value) {
    _pro = _value;
  }

  List<dynamic> _qualifs = [
    jsonDecode(
        '{\"code\":\"231\",\"content\":\"Fabrication et pose de charpente traditionnelle et structure en bois\"}'),
    jsonDecode(
        '{\"code\":\"235\",\"content\":\"Fourniture et pose de bâtiments à ossature bois\"}'),
    jsonDecode(
        '{\"code\":\"237\",\"content\":\"Fourniture et pose de charpente et structures industrialisées en bois\"}'),
    jsonDecode(
        '{\"code\":\"238\",\"content\":\"Fourniture et pose de bâtiments en panneaux bois massifs croisés\"}'),
    jsonDecode(
        '{\"code\":\"239\",\"content\":\"Réparation et restauration de charpente\"}')
  ];
  List<dynamic> get qualifs => _qualifs;
  set qualifs(List<dynamic> _value) {
    _qualifs = _value;
  }

  void addToQualifs(dynamic _value) {
    _qualifs.add(_value);
  }

  void removeFromQualifs(dynamic _value) {
    _qualifs.remove(_value);
  }

  List<String> _operations = [
    'Installation de charpente',
    'Remplacement de charpente',
    'Réparations sur charpente',
    'Enlèvement/Raccourcissement de charpente'
  ];
  List<String> get operations => _operations;
  set operations(List<String> _value) {
    _operations = _value;
  }

  void addToOperations(String _value) {
    _operations.add(_value);
  }

  void removeFromOperations(String _value) {
    _operations.remove(_value);
  }

  String _selectedoperation = '';
  String get selectedoperation => _selectedoperation;
  set selectedoperation(String _value) {
    _selectedoperation = _value;
  }

  String _manualdestination = '';
  String get manualdestination => _manualdestination;
  set manualdestination(String _value) {
    _manualdestination = _value;
  }

  String _preciselocation = '';
  String get preciselocation => _preciselocation;
  set preciselocation(String _value) {
    _preciselocation = _value;
  }

  double _normalfontsize = 15;
  double get normalfontsize => _normalfontsize;
  set normalfontsize(double _value) {
    _normalfontsize = _value;
  }

  double _smallpolice = 13;
  double get smallpolice => _smallpolice;
  set smallpolice(double _value) {
    _smallpolice = _value;
  }

  double _tinyfont = 12;
  double get tinyfont => _tinyfont;
  set tinyfont(double _value) {
    _tinyfont = _value;
    prefs.setDouble('ff_tinyfont', _value);
  }

  List<dynamic> _messagesdata = [];
  List<dynamic> get messagesdata => _messagesdata;
  set messagesdata(List<dynamic> _value) {
    _messagesdata = _value;
  }

  void addToMessagesdata(dynamic _value) {
    _messagesdata.add(_value);
  }

  void removeFromMessagesdata(dynamic _value) {
    _messagesdata.remove(_value);
  }

  String _signaturepath = '';
  String get signaturepath => _signaturepath;
  set signaturepath(String _value) {
    _signaturepath = _value;
  }

  String _sigurl = '';
  String get sigurl => _sigurl;
  set sigurl(String _value) {
    _sigurl = _value;
  }

  dynamic _basisdata;
  dynamic get basisdata => _basisdata;
  set basisdata(dynamic _value) {
    _basisdata = _value;
  }

  List<dynamic> _finishedworks = [];
  List<dynamic> get finishedworks => _finishedworks;
  set finishedworks(List<dynamic> _value) {
    _finishedworks = _value;
  }

  void addToFinishedworks(dynamic _value) {
    _finishedworks.add(_value);
  }

  void removeFromFinishedworks(dynamic _value) {
    _finishedworks.remove(_value);
  }

  List<dynamic> _searchesworks = [];
  List<dynamic> get searchesworks => _searchesworks;
  set searchesworks(List<dynamic> _value) {
    _searchesworks = _value;
  }

  void addToSearchesworks(dynamic _value) {
    _searchesworks.add(_value);
  }

  void removeFromSearchesworks(dynamic _value) {
    _searchesworks.remove(_value);
  }

  List<dynamic> _currentworkslist = [];
  List<dynamic> get currentworkslist => _currentworkslist;
  set currentworkslist(List<dynamic> _value) {
    _currentworkslist = _value;
  }

  void addToCurrentworkslist(dynamic _value) {
    _currentworkslist.add(_value);
  }

  void removeFromCurrentworkslist(dynamic _value) {
    _currentworkslist.remove(_value);
  }

  String _demanddescription = '';
  String get demanddescription => _demanddescription;
  set demanddescription(String _value) {
    _demanddescription = _value;
  }

  String _demandlocation = '';
  String get demandlocation => _demandlocation;
  set demandlocation(String _value) {
    _demandlocation = _value;
  }

  String _appmode = 'client';
  String get appmode => _appmode;
  set appmode(String _value) {
    _appmode = _value;
    prefs.setString('ff_appmode', _value);
  }

  String _ownrocketchatid = '';
  String get ownrocketchatid => _ownrocketchatid;
  set ownrocketchatid(String _value) {
    _ownrocketchatid = _value;
    prefs.setString('ff_ownrocketchatid', _value);
  }

  List<dynamic> _currentoffers = [];
  List<dynamic> get currentoffers => _currentoffers;
  set currentoffers(List<dynamic> _value) {
    _currentoffers = _value;
  }

  void addToCurrentoffers(dynamic _value) {
    _currentoffers.add(_value);
  }

  void removeFromCurrentoffers(dynamic _value) {
    _currentoffers.remove(_value);
  }

  List<dynamic> _currentquestions = [];
  List<dynamic> get currentquestions => _currentquestions;
  set currentquestions(List<dynamic> _value) {
    _currentquestions = _value;
  }

  void addToCurrentquestions(dynamic _value) {
    _currentquestions.add(_value);
  }

  void removeFromCurrentquestions(dynamic _value) {
    _currentquestions.remove(_value);
  }

  String _rocketchattoken = '';
  String get rocketchattoken => _rocketchattoken;
  set rocketchattoken(String _value) {
    _rocketchattoken = _value;
    prefs.setString('ff_rocketchattoken', _value);
  }

  dynamic _cachedoffer;
  dynamic get cachedoffer => _cachedoffer;
  set cachedoffer(dynamic _value) {
    _cachedoffer = _value;
  }

  String _rocketchatapiendpoint =
      'http://node149514-env-7236997.sh2.hidora.net:11341';
  String get rocketchatapiendpoint => _rocketchatapiendpoint;
  set rocketchatapiendpoint(String _value) {
    _rocketchatapiendpoint = _value;
    prefs.setString('ff_rocketchatapiendpoint', _value);
  }

  List<String> _selectedqualifs = [];
  List<String> get selectedqualifs => _selectedqualifs;
  set selectedqualifs(List<String> _value) {
    _selectedqualifs = _value;
  }

  void addToSelectedqualifs(String _value) {
    _selectedqualifs.add(_value);
  }

  void removeFromSelectedqualifs(String _value) {
    _selectedqualifs.remove(_value);
  }

  dynamic _cachedsearch;
  dynamic get cachedsearch => _cachedsearch;
  set cachedsearch(dynamic _value) {
    _cachedsearch = _value;
  }

  List<LatLng> _offerslocations = [];
  List<LatLng> get offerslocations => _offerslocations;
  set offerslocations(List<LatLng> _value) {
    _offerslocations = _value;
  }

  void addToOfferslocations(LatLng _value) {
    _offerslocations.add(_value);
  }

  void removeFromOfferslocations(LatLng _value) {
    _offerslocations.remove(_value);
  }

  List<double> _cachedsearchepicentre = [];
  List<double> get cachedsearchepicentre => _cachedsearchepicentre;
  set cachedsearchepicentre(List<double> _value) {
    _cachedsearchepicentre = _value;
  }

  void addToCachedsearchepicentre(double _value) {
    _cachedsearchepicentre.add(_value);
  }

  void removeFromCachedsearchepicentre(double _value) {
    _cachedsearchepicentre.remove(_value);
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
