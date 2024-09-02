import 'animal.dart';
import 'car.dart';
import 'person.dart';

void main(List<String> arguments) {
  final blueCar = Car(
    color: 'blue',
    seats: 2,
    power: 100.42,
  );

  blueCar.drive();

  final studentA = Student(age: 23, name: 'Peter');
  final personA = Person(age: 22, name: 'Marie');

  studentA.run();
  studentA.jump();
  personA.run();

  Animal animal = Cow();

  print('Unser Tier macht ${animalSound(animal)}');

  final (lang, long) = getPosition();
  print('langitude: $lang');
  print('longitude: $long');
}

String animalSound(Animal animal) {
  switch (animal) {
    case Cow():
      return 'muh';
    case Sheep():
      return 'mäh';
    case Pig():
      return 'oink';
    case Lion():
      return 'roahr';
  }
}

String describeDate(DateTime dt) => switch (dt.weekday) {
  1 => 'Feeling relaxed after the weekend?',
  6 || 7 => 'WEEKEND; HURRAY!',
  _ => 'Hang in there'
};

/// dart records
(double, double) getPosition() {
  return (12, 24);
}
