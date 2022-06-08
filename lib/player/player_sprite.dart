import 'package:bonfire/bonfire.dart';

class PlayerSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
    int amount,
    int row,
    int column,
  ) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(16 * (column - 1), 16 * (row - 1)),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('knight_idle_left.png', 1, 1, 2);
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('knight_idle_right.png', 1, 1, 2);
  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage('knight_run_left.png', 3, 1, 1);
  static Future<SpriteAnimation> get runRight =>
      _sequenceImage('knight_run_right.png', 3, 1, 1);
  static Future<SpriteAnimation> get die =>
      _sequenceImage('knight_die.png', 1, 1, 1);
}
