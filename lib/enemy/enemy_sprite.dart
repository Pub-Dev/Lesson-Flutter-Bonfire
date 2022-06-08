import 'package:bonfire/bonfire.dart';

class EnemySprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
    int amount,
    int row,
    int column,
  ) {
    return SpriteAnimation.load(
      'enemies/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(16 * (column - 1), 16 * (row - 1)),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('goblin_idle_left.png', 1, 1, 1);
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('goblin_idle_right.png', 1, 1, 1);
  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage('goblin_run_left.png', 3, 1, 1);
  static Future<SpriteAnimation> get runRight =>
      _sequenceImage('goblin_run_right.png', 3, 1, 1);
}
