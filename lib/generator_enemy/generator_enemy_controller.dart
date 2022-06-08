import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:lesson_flutter_bonfire/enemy/enemy_controller.dart';

class GeneratorEnemyController extends StateController<EnemyController> {
  void summonTwo() {}

  void summon() {
    final hasGameRef = component?.hasGameRef ?? false;
    if (hasGameRef && !gameRef.camera.isMoving) {
      final enemy = EnemyController(
        _randomPosition(),
      );
      gameRef.add(enemy);
    }
  }

  Vector2 _randomPosition() {
    final random = Random();
    final position = random.nextInt(4);
    double x = 0, y = 0;
    switch (position) {
      case 0:
        x = 10;
        y = 10;
        break;
      case 1:
        x = 10;
        y = 20;
        break;
      case 2:
        x = 20;
        y = 10;
        break;
      case 3:
        x = 20;
        y = 20;
        break;
    }
    return Vector2(
      32 * x,
      32 * y,
    );
  }

  @override
  void update(double dt, EnemyController component) {}
}
