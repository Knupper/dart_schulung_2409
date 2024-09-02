class Person {
  late String name;
  late int age;

  Person({required this.age, required this.name});

  void run() {
    print('$name runs!');
  }
}

class Student extends Person with Jumper, Swimmer {
  late int semester;

  Student({
    required super.age,
    required super.name,
    this.semester = 1,
  });

  @override
  void run() {
    print('student $name runs!');
  }
}

mixin Jumper {
  void jump() {
    print('i can jump');
  }
}

mixin Swimmer {
  void swim() {
    print('i can swim');
  }
}
