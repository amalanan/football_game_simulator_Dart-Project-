
import 'dart:math';
import 'models.dart';

class Referee {
  //required fields
  String _name;
  String _nationality;

  //optional (randomly generated)
  final RefereeStyle _style;

  Referee({required String name, required String nationality})
    : _name = name,
      _nationality = nationality,
      _style =
          RefereeStyle.values[Random().nextInt(RefereeStyle.values.length)];

  //getters
  String get name => _name;

  String get nationality => _nationality;

  RefereeStyle get style => _style;

  //setters
  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Referee name cannot be empty.');
    } else {
      _name = value;
    }
  }

  set nationality(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Nationality cannot be empty.');
    } else {
      _nationality = value;
    }
  }

  int getRandomFactor() {
    switch (_style) {
      case RefereeStyle.strict: //unpredictable referee
        return Random().nextInt(30) - 15; // random factor between -15 and +14
      case RefereeStyle.lenient: //lowly variance referee
        return Random().nextInt(10) - 2; // random factor between -2 and +7
      case RefereeStyle.balanced: //fair referee
        return Random().nextInt(15) - 7; // random factor between -7 and +7
    }
  }

  @override
  String toString() {
    String styleDesc = _style.name[0].toUpperCase() + _style.name.substring(1);
    return 'Referee: $name ($nationality) | Style: $styleDesc';
  }
}
