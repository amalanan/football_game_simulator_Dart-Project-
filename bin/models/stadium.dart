<<<<<<< HEAD
import 'dart:math';
import 'models.dart';

class Stadium {
  //required fields
  String _name;
  String _location;

  //optional fields
  int? _capacity;
  WeatherCondition? _weather;
  String? _turfType;

  Stadium({required String name, required String location})
    : _name = name,
      _location = location,
      _weather =
          WeatherCondition.values[Random().nextInt(
            WeatherCondition.values.length,
          )];

  Stadium.withDetails({
    required String name,
    required String location,
    int? capacity,
    WeatherCondition? weather,
    String? turfType,
  }) : _name = name,
       _location = location,
       _capacity = capacity,
       _weather =
           weather ??
           WeatherCondition.values[Random().nextInt(
             WeatherCondition.values.length,
           )],
       _turfType = turfType;

  //getters
  String get name => _name;

  String get location => _location;

  int? get capacity => _capacity;

  WeatherCondition? get weather => _weather;

  String? get turfType => _turfType;

  //setters
  set name(String value) {
    if (value.isEmpty) throw ArgumentError('Stadium name cannot be empty.');
    _name = value;
  }

  set location(String value) {
    if (value.isEmpty) throw ArgumentError('Location cannot be empty.');
    _location = value;
  }

  set capacity(int? value) {
    if (value != null && value < 0)
      throw ArgumentError('Capacity cannot be negative.');
    _capacity = value;
  }

  set turfType(String? value) {
    if (value != null && value.isEmpty)
      throw ArgumentError('Turf type cannot be an empty string.');
    _turfType = value;
  }

  set weather(WeatherCondition? newWeather) {
    _weather =
        newWeather ??
        WeatherCondition.values[Random().nextInt(
          WeatherCondition.values.length,
        )];
  }

  @override
  String toString() {
    final String weatherDesc =
        _weather != null
            ? _weather!.name[0].toUpperCase() + _weather!.name.substring(1)
            : 'Clear';

    return 'Stadium: $name ($location) | Weather: $weatherDesc | Turf: ${_turfType ?? "Natural"}';
  }
}
=======
import 'dart:math';
import 'models.dart';

class Stadium {
  //required fields
  String _name;
  String _location;

  //optional fields
  int? _capacity;
  WeatherCondition? _weather;
  String? _turfType;

  Stadium({required String name, required String location})
    : _name = name,
      _location = location,
      _weather =
          WeatherCondition.values[Random().nextInt(
            WeatherCondition.values.length,
          )];

  Stadium.withDetails({
    required String name,
    required String location,
    int? capacity,
    WeatherCondition? weather,
    String? turfType,
  }) : _name = name,
       _location = location,
       _capacity = capacity,
       _weather =
           weather ??
           WeatherCondition.values[Random().nextInt(
             WeatherCondition.values.length,
           )],
       _turfType = turfType;

  //getters
  String get name => _name;

  String get location => _location;

  int? get capacity => _capacity;

  WeatherCondition? get weather => _weather;

  String? get turfType => _turfType;

  //setters
  set name(String value) {
    if (value.isEmpty) throw ArgumentError('Stadium name cannot be empty.');
    _name = value;
  }

  set location(String value) {
    if (value.isEmpty) throw ArgumentError('Location cannot be empty.');
    _location = value;
  }

  set capacity(int? value) {
    if (value != null && value < 0)
      throw ArgumentError('Capacity cannot be negative.');
    _capacity = value;
  }

  set turfType(String? value) {
    if (value != null && value.isEmpty)
      throw ArgumentError('Turf type cannot be an empty string.');
    _turfType = value;
  }

  set weather(WeatherCondition? newWeather) {
    _weather =
        newWeather ??
        WeatherCondition.values[Random().nextInt(
          WeatherCondition.values.length,
        )];
  }

  @override
  String toString() {
    final String weatherDesc =
        _weather != null
            ? _weather!.name[0].toUpperCase() + _weather!.name.substring(1)
            : 'Clear';

    return 'Stadium: $name ($location) | Weather: $weatherDesc | Turf: ${_turfType ?? "Natural"}';
  }
}
>>>>>>> de206b0e561996bd0cafab4897759f879ca8e966
