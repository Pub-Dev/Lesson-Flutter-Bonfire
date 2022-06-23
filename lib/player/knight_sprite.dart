import 'package:bonfire/bonfire.dart';

class KnightSprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
  ) {
    return SpriteAnimation.load(
      'player/$fileName',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft =>
      _sequenceImage('knight_idle_left.png');
  static Future<SpriteAnimation> get idleRight =>
      _sequenceImage('knight_idle_right.png');
  static Future<SpriteAnimation> get runLeft =>
      _sequenceImage('knight_run_left.png');
  static Future<SpriteAnimation> get runRight =>
      _sequenceImage('knight_run_right.png');
}
