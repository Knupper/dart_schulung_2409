class Car {
  String _color;
  final int _seats;
  final double _power;

  Car({
    required String color,
    required int seats,
    required double power,
  })  : _color = color,
        _seats = seats,
        _power = power;

  set setColor(String color) {
    _color = color;
  }

  get color {
    // logic
    return _color;
  }

  void drive() {
    print('Unser $_color Auto, fährt mit $_power PS und $_seats Leuten über die Straßen.');
  }
}
