import 'dart:async';

void main() async {
  final numberGenerator = NumberGenerator();
  final numberStream = numberGenerator.getStream;

  StreamSubscription sub1 = numberStream.listen(
    (event) {
      print('sub1: $event');
    },
  );

  StreamSubscription sub2 = numberStream.listen(
    (event) {
      print('sub2: ${event * 5}');
    },
  );

  Future.delayed(
    Duration(seconds: 5),
    () {
      sub1.cancel();
    },
  );
}

class NumberGenerator {
  NumberGenerator() {
    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.add(_counter);

      _counter++;
    });

    Future.delayed(const Duration(seconds: 10), () {
      timer.cancel();
      _controller.close();
    });
  }

  int _counter = 0;

  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream.asBroadcastStream();
}
