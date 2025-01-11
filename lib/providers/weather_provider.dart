import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interviewapp/model/weather_model.dart';
import 'package:interviewapp/utils/constants/string_constants.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider with ChangeNotifier {
  String _city = '';
  String _unit = 'metric';
  WeatherDataModel? _weatherDataModel;
  bool _isLoading = false;
  List<WeatherDataModel> _searchHistory = [];

  List<WeatherDataModel> get searchHistory => _searchHistory;
  String get city => _city;
  String get unit => _unit;
  WeatherDataModel? get weatherDataModel => _weatherDataModel;
  bool get isLoading => _isLoading;

  void setCity(String city) {
    _city = city;
    notifyListeners();
  }

  void toggleUnit() {
    _unit = _unit == 'metric' ? 'us' : 'metric';
    notifyListeners();
  }

  Future<void> fetchWeather() async {
    if (_city.isEmpty) return;
    _isLoading = true;
    notifyListeners();
    final apiKey = 'J7N2LMUVGTR82D39ZXF7D6CHU';
    final url = Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$_city?unitGroup=$_unit&key=$apiKey&contentType=json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _weatherDataModel =
            WeatherDataModel.fromJson(json.decode(response.body));
        _searchHistory.insert(0, _weatherDataModel!);
        await saveSearchHistory();
      }
    } catch (e) {
      _weatherDataModel = null;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedHistory = _searchHistory.map((item) => item.toJson()).toList();
    prefs.setString(LocalStorageKey.serchListKey, json.encode(encodedHistory));
  }

  Future<void> loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final savedHistory = prefs.getString(LocalStorageKey.serchListKey);
    if (savedHistory != null) {
      final List<dynamic> decodedHistory = json.decode(savedHistory);
      _searchHistory = decodedHistory
          .map((item) => WeatherDataModel.fromJson(item))
          .toList();
    }
    notifyListeners();
  }
}
