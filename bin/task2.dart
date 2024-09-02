import 'dart:io';

/// Kontaktmanager
/// - kleines menu um funktionen aufzurufen
/// - aufnahme von neuen personen
/// - ausgabe aller personen die in der kartei sind
/// Bonus: Löschen von bestimmten personen
/// Bonus: Sortierte Ausgabe nach name
/// Bonus: Sortierte Ausgabe nach alter
///
///
void main(List<String> arguments) {
  PersonManager manager = PersonManager();

  manager.menu();
}

class PersonManager {
  final List<Person> persons = [];

  PersonManager();

  void add() {
    print('Bitte gebe einen Namen ein:');
    final nameInput = stdin.readLineSync() ?? '';
    print('Bitte gebe das Alter ein:');
    final ageInput = stdin.readLineSync() ?? '';

    final parsedAge = int.tryParse(ageInput) ?? 0;

    final newPerson = Person(age: parsedAge, name: nameInput);

    persons.add(newPerson);
  }

  // Should not be part of this class -> better a own method
  void menu() {
    while (true) {
      print('Was willst du tun: ');
      print('(0) - Programm beenden');
      print('(1) - Person hinzufügen');
      print('(2) - Alle Personen anzeigen');
      print('(3) - Person löschen');
      print('(4) - Alle Personen anzeigen - Sotierung: Name');
      print('(5) - Alle Personen anzeigen - Sotierung: Alter');

      final selection = stdin.readLineSync() ?? '';
      final parsedSelection = int.tryParse(selection);

      switch (parsedSelection) {
        case 0:
          exit(0);
        case 1:
          add();
          break;
        case 2:
          printAll();
          break;
        case 3:
          delete();
          break;
        case 4:
          printAll(shouldBeSortedByName: true);
          break;
        case 5:
          printAll(shouldBeSortedByAge: true);
          break;
        default:
          print('Ungültige Eingabe... Exit');
          break;
      }
    }
  }

  void printAll({
    bool shouldBeSortedByAge = false,
    bool shouldBeSortedByName = false,
  }) {
    final tmpPersons = List<Person>.from(persons);

    if (shouldBeSortedByAge) {
      tmpPersons.sort(
        (a, b) => a.age.compareTo(b.age),
      );
    }

    if (shouldBeSortedByName) {
      tmpPersons.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    }

    for (final (index, person) in tmpPersons.indexed) {
      print('($index) - $person');
    }
  }

  void delete() {
    printAll();
    print('Bitte gebe die Zahl der Person ein die gelöscht werden soll:');
    final numberToDelete = stdin.readLineSync() ?? '';
    final parsedNumber = int.tryParse(numberToDelete);

    if (parsedNumber == null || parsedNumber > persons.length || parsedNumber < 0) {
      print('Ungültige Eingabe!');
      return;
    }

    persons.removeAt(parsedNumber);
  }
}

class Person {
  late String name;
  late int age;

  Person({required this.age, required this.name});

  @override
  String toString() {
    return 'Name: $name, Alter: $age';
  }
}
