import 'dart:io';
import 'dart:math';

/// Aufgabe
/// Vom Nuzter die Zahl einlest
/// prüft ob es die gesucht zahl ist
/// wenn ja herzlichen glückwunsch
/// wenn nicht nächste zahl einlesen
/// Bonus: Mitzählen wie viele Versuche er gebraucht hat
/// Bonus: Nutzer mitteilen ob die gesucht Zahl größer oder kleiner ist.

void main(List<String> arguments) {
  bool hasGuessedNumber = false;
  int tries = 0;
  final randomNumber = Random().nextInt(100);

  print('Bitte gebe eine Zahl ein');

  do {
    tries++;
    final input = getUserInput();
    final parsedInput = int.tryParse(input);

    if (parsedInput == null) {
      print('Bitte gebe eine korrekte Zahl ein, 0-99');
      continue;
    }
    hasGuessedNumber = parsedInput == randomNumber;

    if (hasGuessedNumber) {
      print('Herzlichen Glückwunsch, du hast Zahl $randomNumber nach $tries erraten.');
    } else {
      if (randomNumber < parsedInput) {
        print('Die gesuchte Zahl ist kleiner. Bitte gebe eine neue Zahl ein.');
      } else {
        print('Die gesuchte Zahl ist großer. Bitte gebe eine neue Zahl ein.');
      }
    }
  } while (hasGuessedNumber == false);
}

String getUserInput() {
  final userInput = stdin.readLineSync() ?? '';

  return userInput;
}
