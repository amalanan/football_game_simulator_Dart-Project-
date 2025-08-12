import 'models.dart';

class Team {
  // required fields
  String _teamName;
  Trainer _trainer;
  List<Player> _players;

  // optional fields
  String? _mascot;
  String? _city;
  String? _motto;
  List<String>? _teamColors;

  Team({required String teamName, required Trainer trainer})
    : _teamName = teamName,
      _trainer = trainer,
      _players = [];

  Team.withDetails({
    required String teamName,
    required Trainer trainer,
    required List<Player> players,
    String? city,
    String? motto,
    List<String>? teamColors,
    String? mascot,
  }) : _teamName = teamName,
       _trainer = trainer,
       _players = players,
       _city = city,
       _motto = motto,
       _teamColors = teamColors,
       _mascot = mascot;

  String get teamName => _teamName;

  Trainer get trainer => _trainer;

  List<Player> get players => List.unmodifiable(_players);

  String? get city => _city;

  String? get motto => _motto;

  List<String>? get teamColors => _teamColors;

  String? get mascot => _mascot;

  // Setters
  set teamName(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Team Name cannot be empty');
    } else {
      _teamName = value;
    }
  }

  set trainer(Trainer value) {
    _trainer = value;
  }

  set city(String? value) {
    if (value != null && value.isEmpty) {
      throw ArgumentError('City cannot be an empty string.');
    } else {
      _city = value;
    }
  }

  set motto(String? value) {
    if (value != null && value.isEmpty) {
      throw ArgumentError('Motto cannot be an empty string.');
    } else {
      _motto = value;
    }
  }

  set teamColors(List<String>? value) {
    _teamColors = value;
  }

  set mascot(String? value) {
    if (value != null && value.isEmpty) {
      throw ArgumentError('Mascot cannot be an empty string.');
    } else {
      _mascot = value;
    }
  }

  set players(List<Player> value) {
    _players = List.from(value);
  }

  void addPlayer(Player newPlayer) {
    _players.add(newPlayer);
  }

  void addPlayers(List<Player> newPlayers) {
    _players.addAll(newPlayers);
  }

  bool removePlayer(Player player) {
    return _players.remove(player);
  }

  //calculates the sum of the power of the players on the team
  int calculatePlayersPower() {
    return _players.fold(0, (sum, player) => sum + player.power);
  }

  @override
  String toString() {
    final String playersListString =
        _players.isNotEmpty
            ? _players.map((p) => "  - ${p.toString()}").join('\n')
            : '  No players in the squad.';
    // i used .map() to transform a list of the player into a string of that player toString information jpining the new line string
    return 'Team: ${_teamName.toUpperCase()}' +
        'Coach: ${_trainer.toString()}' +
        'Squad (${_players.length} players, Total Power: ${calculatePlayersPower()}):$playersListString';
  }
}
