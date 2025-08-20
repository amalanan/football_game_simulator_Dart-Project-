
import 'dart:math';

class Trainer {
  //required fields
  String _name;
  final int _experience;

  //optional fields
  String? _strategySpecialty;
  int? _motivation;

  Trainer({required String name})
    : _name = name,
      _experience = Random().nextInt(50) + 50; //cuz the real range is 50-99

  Trainer.withDetails({
    required String name,
    String? strategySpecialty,
    int? motivation,
  }) : _name = name,
       _experience = Random().nextInt(50) + 50,
       _strategySpecialty = strategySpecialty,
       _motivation = motivation;

  //getters (encapsulation)
  String get name => _name;

  int get experience => _experience;

  String? get strategySpecialty => _strategySpecialty;

  int? get motivation => _motivation;

  // Setters
  set name(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Trainer name cannot be empty');
    }
    _name = value;
  }

  set strategySpecialty(String? value) {
    if (value != null && value.isEmpty) {
      throw ArgumentError('Strategy specialty cannot be an empty string.');
    } else {
      _strategySpecialty = value;
    }
  }

  set motivation(int? value) {
    if (value != null && (value < 1 || value > 10)) {
      throw ArgumentError('Motivation must be between 1 and 10.');
    } else {
      _motivation = value;
    }
  }

  // polymorphism (using the toString method from the Object class(the main parent of all classes))
  @override
 String toString() {
    return 'Coach: $name | Experience: $_experience | Specialty: ${_strategySpecialty ?? "Balanced"}';
  }
}
