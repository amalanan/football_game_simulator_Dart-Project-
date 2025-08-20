<<<<<<< HEAD
import 'models.dart';

class Game {
  final Team _team1;
  final Team _team2;
  final Stadium _stadium;
  final Referee _referee;
  final Strategy _team1Strategy;
  final Strategy _team2Strategy;

  late int _team1TotalPower;
  late int _team2TotalPower;
  late Team _winner;
  late String _matchCommentary;

  Game({
    required Team team1,
    required Team team2,
    required Stadium stadium,
    required Referee referee,
    required Strategy team1Strategy,
    required Strategy team2Strategy,
  }) : _team1 = team1,
       _team2 = team2,
       _stadium = stadium,
       _referee = referee,
       _team1Strategy = team1Strategy,
       _team2Strategy = team2Strategy;

  //we have here 6 strategy cases (offensive,defensive,balanced,counterAttack,pressing,parkTheBus),
  //every case contains some cases for the opposite team strategy so its just bringing all the possibilities of the how the game or the two strategies going to be

  //Payoff Matrix
  int _getStrategyBonus(Strategy myStrategy, Strategy opponentStrategy) {
    switch (myStrategy) {
      //cases for the offensive case
      case Strategy.offensive:
        switch (opponentStrategy) {
          case Strategy.defensive:
            return 5; //struggles vs defense
          case Strategy.parkTheBus:
            return -10; //very weak vs more defensive
          case Strategy.counterAttack:
            return 15; //good against waiting for a counter
          default:
            return 10; //default bonus for being offensive
        }
      //cases for the defensive case
      case Strategy.defensive:
        switch (opponentStrategy) {
          case Strategy.offensive:
            return 20; //Strong bonus vs offense
          case Strategy.counterAttack:
            return -5; //Vulnerable to counters
          default:
            return 10; //default bonus for being defensive
        }
      case Strategy.balanced:
        return opponentStrategy == Strategy.balanced ? 7 : 10;

      case Strategy.counterAttack:
        switch (opponentStrategy) {
          case Strategy.offensive:
            return 25; // ideal against attacking teams
          case Strategy.defensive:
            return 5;
          case Strategy.parkTheBus:
            return 0; //its hard to counter a team that doesn't attack
          default:
            return 15;
        }
      case Strategy.pressing:
        return opponentStrategy == Strategy.balanced ? 20 : 15;

      case Strategy.parkTheBus:
        return opponentStrategy == Strategy.offensive
            ? 30
            : 5; //max defense bonus
    }
  }

  // this method calculates the final power for a single team
  int _calculateTotalPower(
    Team team,
    Strategy teamStrategy,
    Strategy opponentStrategy,
  ) {
    int playersPower =
        team.calculatePlayersPower(); // calling the method that calculates the sum of player powers
    int trainerPower =
        team
            .trainer
            .experience; //getting the power of the player by getting its experience
    int strategyBonus = _getStrategyBonus(
      teamStrategy,
      opponentStrategy,
    ); //getting the bonus of the strategy that every team has used
    int randomFactor =
        _referee
            .getRandomFactor(); // getting the referee random factor based on the referee

    int totalPower =
        playersPower +
        trainerPower +
        strategyBonus +
        randomFactor; //total power by summing everything we called
    return totalPower > 0 ? totalPower : 0;
  }

  // Running the entire match simulation.
  void simulate() {
    _team1TotalPower = _calculateTotalPower(
      _team1,
      _team1Strategy,
      _team2Strategy,
    );
    _team2TotalPower = _calculateTotalPower(
      _team2,
      _team2Strategy,
      _team1Strategy,
    );
    if (_team1TotalPower > _team2TotalPower) {
      _winner = _team1; //winner has highest total team power
    } else if (_team2TotalPower > _team1TotalPower) {
      _winner = _team2;
    } else {
      _winner =
          _team1.calculatePlayersPower() >= _team2.calculatePlayersPower()
              ? _team1
              : _team2;
    }
    _generateCommentary(); //commentary for the match
  }

  //this method creates a summary of the match events.
  void _generateCommentary() {
    _matchCommentary =
        "The match between ${_team1.teamName} and ${_team2.teamName} was amazing!\n"
        "Under the watchful eye of referee ${_referee.name}, both teams gave their all.\n"
        "${_team1.teamName} chose a ${_team1Strategy.name} strategy, while ${_team2.teamName} opted for a ${_team2Strategy.name} approach.\n"
        "After a hard-fought battle, ${_winner.teamName} emerged victorious!";
  }

  //(polymorphisim) this method prints the final, formatted results of the match to the console.
  void printResult() {
    print("\n\n${"=" * 45}");
    print(" " * 9 + "MATCH SIMULATION RESULT");
    print("=" * 45);
    print(_stadium);
    print(_referee);
    print("-" * 45);
    print("HOME: ${_team1.teamName} (Strategy: ${_team1Strategy.name})");
    print("AWAY: ${_team2.teamName} (Strategy: ${_team2Strategy.name})");
    print("-" * 45);
    print("FINAL POWER SCORE:");
    print("  - ${_team1.teamName}: $_team1TotalPower");
    print("  - ${_team2.teamName}: $_team2TotalPower");
    print("-" * 45);
    print("WINNER: ${_winner.teamName.toUpperCase()}");
    print("\nMATCH COMMENTARY:\n$_matchCommentary");
    print("=" * 45);
  }
}
=======
import 'models.dart';

class Game {
  final Team _team1;
  final Team _team2;
  final Stadium _stadium;
  final Referee _referee;
  final Strategy _team1Strategy;
  final Strategy _team2Strategy;

  late int _team1TotalPower;
  late int _team2TotalPower;
  late Team _winner;
  late String _matchCommentary;

  Game({
    required Team team1,
    required Team team2,
    required Stadium stadium,
    required Referee referee,
    required Strategy team1Strategy,
    required Strategy team2Strategy,
  }) : _team1 = team1,
       _team2 = team2,
       _stadium = stadium,
       _referee = referee,
       _team1Strategy = team1Strategy,
       _team2Strategy = team2Strategy;

  //we have here 6 strategy cases (offensive,defensive,balanced,counterAttack,pressing,parkTheBus),
  //every case contains some cases for the opposite team strategy so its just bringing all the possibilities of the how the game or the two strategies going to be

  //Payoff Matrix
  int _getStrategyBonus(Strategy myStrategy, Strategy opponentStrategy) {
    switch (myStrategy) {
      //cases for the offensive case
      case Strategy.offensive:
        switch (opponentStrategy) {
          case Strategy.defensive:
            return 5; //struggles vs defense
          case Strategy.parkTheBus:
            return -10; //very weak vs more defensive
          case Strategy.counterAttack:
            return 15; //good against waiting for a counter
          default:
            return 10; //default bonus for being offensive
        }
      //cases for the defensive case
      case Strategy.defensive:
        switch (opponentStrategy) {
          case Strategy.offensive:
            return 20; //Strong bonus vs offense
          case Strategy.counterAttack:
            return -5; //Vulnerable to counters
          default:
            return 10; //default bonus for being defensive
        }
      case Strategy.balanced:
        return opponentStrategy == Strategy.balanced ? 7 : 10;

      case Strategy.counterAttack:
        switch (opponentStrategy) {
          case Strategy.offensive:
            return 25; // ideal against attacking teams
          case Strategy.defensive:
            return 5;
          case Strategy.parkTheBus:
            return 0; //its hard to counter a team that doesn't attack
          default:
            return 15;
        }
      case Strategy.pressing:
        return opponentStrategy == Strategy.balanced ? 20 : 15;

      case Strategy.parkTheBus:
        return opponentStrategy == Strategy.offensive
            ? 30
            : 5; //max defense bonus
    }
  }

  // this method calculates the final power for a single team
  int _calculateTotalPower(
    Team team,
    Strategy teamStrategy,
    Strategy opponentStrategy,
  ) {
    int playersPower =
        team.calculatePlayersPower(); // calling the method that calculates the sum of player powers
    int trainerPower =
        team
            .trainer
            .experience; //getting the power of the player by getting its experience
    int strategyBonus = _getStrategyBonus(
      teamStrategy,
      opponentStrategy,
    ); //getting the bonus of the strategy that every team has used
    int randomFactor =
        _referee
            .getRandomFactor(); // getting the referee random factor based on the referee

    int totalPower =
        playersPower +
        trainerPower +
        strategyBonus +
        randomFactor; //total power by summing everything we called
    return totalPower > 0 ? totalPower : 0;
  }

  // Running the entire match simulation.
  void simulate() {
    _team1TotalPower = _calculateTotalPower(
      _team1,
      _team1Strategy,
      _team2Strategy,
    );
    _team2TotalPower = _calculateTotalPower(
      _team2,
      _team2Strategy,
      _team1Strategy,
    );
    if (_team1TotalPower > _team2TotalPower) {
      _winner = _team1; //winner has highest total team power
    } else if (_team2TotalPower > _team1TotalPower) {
      _winner = _team2;
    } else {
      _winner =
          _team1.calculatePlayersPower() >= _team2.calculatePlayersPower()
              ? _team1
              : _team2;
    }
    _generateCommentary(); //commentary for the match
  }

  //this method creates a summary of the match events.
  void _generateCommentary() {
    _matchCommentary =
        "The match between ${_team1.teamName} and ${_team2.teamName} was amazing!\n"
        "Under the watchful eye of referee ${_referee.name}, both teams gave their all.\n"
        "${_team1.teamName} chose a ${_team1Strategy.name} strategy, while ${_team2.teamName} opted for a ${_team2Strategy.name} approach.\n"
        "After a hard-fought battle, ${_winner.teamName} emerged victorious!";
  }

  //(polymorphisim) this method prints the final, formatted results of the match to the console.
  void printResult() {
    print("\n\n${"=" * 45}");
    print(" " * 9 + "MATCH SIMULATION RESULT");
    print("=" * 45);
    print(_stadium);
    print(_referee);
    print("-" * 45);
    print("HOME: ${_team1.teamName} (Strategy: ${_team1Strategy.name})");
    print("AWAY: ${_team2.teamName} (Strategy: ${_team2Strategy.name})");
    print("-" * 45);
    print("FINAL POWER SCORE:");
    print("  - ${_team1.teamName}: $_team1TotalPower");
    print("  - ${_team2.teamName}: $_team2TotalPower");
    print("-" * 45);
    print("WINNER: ${_winner.teamName.toUpperCase()}");
    print("\nMATCH COMMENTARY:\n$_matchCommentary");
    print("=" * 45);
  }
}
>>>>>>> de206b0e561996bd0cafab4897759f879ca8e966
