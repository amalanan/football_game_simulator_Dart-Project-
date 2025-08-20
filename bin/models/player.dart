import 'dart:math';
import 'models.dart';

class Player {
  //required fields
  String _name;
  Position _position;
  final int _id;
  final int _power; //which is random

  //optional fields
  int? _age;
  String? _nationality;
  int? _stamina;
  List<String> _skills;
  int? _jerseyNumber;

  Player({required String name, required int id, required Position position})
    : _name = name,
      _id = id,
      _position = position,
      _power = Random().nextInt(100) + 1,
      _skills = [];

  //randomly putting the power of the player from 1 to 100
  Player.withDetails({
    required String name,
    required Position position,
    required int id,
    int? age,
    String? nationality,
    int? stamina,
    List<String>? skills,
    int? jerseyNumber,
  }) : _name = name,
       _position = position,
       _id = id,
       _power = Random().nextInt(100) + 1,
       _age = age,
       _nationality = nationality,
       _stamina = stamina,
       _skills = skills ?? [],
       _jerseyNumber = jerseyNumber;

  //getters (encapsulation)
  String get name => _name;

  Position get position => _position;

  int get id => _id;

  int get power => _power;

  int? get age => _age;

  String? get nationality => _nationality;

  int? get stamina => _stamina;

  List<String> get skills => List.unmodifiable(_skills);

  int? get jerseyNumber => _jerseyNumber;

  // Setters (encapsulation)
  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError('name cannot be empty');
    }
    _name = value;
  }

  set position(Position value) {
    _position = value;
  }

  set age(int? value) {
    if (value != null && value <= 15) {
      throw ArgumentError('Age must be greater than 15.');
    } else {
      _age = value;
    }
  }

  set nationality(String? value) {
    if (value != null && value.isEmpty) {
      throw ArgumentError('Nationality cannot be an empty string.');
    } else {
      _nationality = value;
    }
  }

  set stamina(int? value) {
    if (value != null && (value < 0 || value > 100)) {
      throw ArgumentError('Stamina must be between 0 and 100.');
    } else {
      _stamina = value;
    }
  }

  set skills(List<String>? value) {
    if (value == null || value.isEmpty) {
      throw ArgumentError('Skills list cannot be empty');
    } else {
      _skills = value;
    }
  }

  set jerseyNumber(int? value) {
    if (value != null && (value < 1 || value > 99)) {
      throw ArgumentError('Jersey number must be between 1 and 99.');
    } else {
      _jerseyNumber = value;
    }
  }

  // polymorphism (using the toString method from the Object class(the main parent of all classes))
  @override
  String toString() {
    String posName =
        _position.name[0].toUpperCase() + _position.name.substring(1);
    return 'Player: $_name (#${_jerseyNumber ?? 'N/A'}) | Position: $posName | Power: $_power';
  }
}
