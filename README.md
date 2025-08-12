# Football Game Simulator

A console-based football (soccer) match simulator built with Dart. This project uses Object-Oriented Programming (OOP) principles and game theory to simulate a strategic match between two teams, taking into account player skills, trainer experience, team strategies, and other random factors.

This project was developed as a comprehensive exercise in OOP, demonstrating concepts like encapsulation, composition, and polymorphism.


## 🌟 Features

*   **Dynamic Team Creation:** Interactively create two unique teams, each with a custom name, a trainer, and a roster of players.
*   **OOP by Design:** All game entities (Player, Trainer, Team, Stadium, Referee) are modeled as classes with clear properties and methods.
*   **Strategic Gameplay (Game Theory):** Choose from a variety of tactics for your team (e.g., Offensive, Defensive, Pressing). The outcome is influenced by a payoff matrix where your strategic choice interacts with your opponent's.
*   **Randomized Elements:** Player power, trainer experience, weather conditions, and referee strictness are randomized to ensure every match is unique.
*   **Custom "Referee" Actor:** A custom `Referee` class was implemented as an innovative feature. The referee's randomly assigned `style` (Lenient, Balanced, or Strict) directly influences the match's "random factor," adding another layer of unpredictability.
*   **Detailed Match Summary:** After the simulation, a comprehensive report is printed to the console, showing team details, strategies, power scores, and the final winner.

## 🛠️ Technologies Used

*   **Language:** [Dart](https://dart.dev/ )
*   **Core Concepts:** Object-Oriented Programming (OOP), Game Theory, Console I/O

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

You need to have the Dart SDK installed on your computer. You can find installation instructions here: [Install the Dart SDK](https://dart.dev/get-dart ).

To verify your installation, run the following command in your terminal:
```sh
dart --version
```

### Installation & Running the Simulator

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/your-repository-name.git
    ```
    (Replace `your-username` and `your-repository-name` with your actual GitHub details )

2.  **Navigate to the project directory:**
    ```sh
    cd your-repository-name
    ```

3.  **Run the application:**
    Execute the `main.dart` file using the Dart runtime.
    ```sh
    dart main.dart
    ```

4.  **Follow the on-screen prompts:**
    The console will guide you through setting up both teams, the stadium, the referee, and choosing strategies. Once all information is entered, the simulation will run and display the results.

## 📂 Project Structure

The project is organized into two main files for clarity and separation of concerns:

*   `models.dart`: Contains all the data classes (`Player`, `Trainer`, `Team`, `Stadium`, `Referee`) and `enum` definitions (`Position`, `Strategy`, etc.). This file defines the "actors" and "data structures" of the simulation.
*   `main.dart`: The entry point of the application. It contains the user interface logic (handling console input/output) and the `main()` function that orchestrates the entire simulation.

## 📝 Project Author

*   **[Amal Anan]** 

