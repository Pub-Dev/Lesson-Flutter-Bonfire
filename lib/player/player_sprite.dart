import 'package:bonfire/bonfire.dart';

class PlayerSprite {
  static Future<SpriteAnimation> _sequenceImage(
      int amount, int row, int column) {
    return SpriteAnimation.load(
      'avatars/trainer_1.png',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(42, 57),
        texturePosition: Vector2(42 * (column - 1), 57 * (row - 1)),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft => _sequenceImage(1, 2, 2);
  static Future<SpriteAnimation> get idleRight => _sequenceImage(1, 3, 2);
  static Future<SpriteAnimation> get runLeft => _sequenceImage(3, 2, 1);
  static Future<SpriteAnimation> get runRight => _sequenceImage(3, 3, 1);
  static Future<SpriteAnimation> get idleDown => _sequenceImage(1, 1, 2);
  static Future<SpriteAnimation> get runDown => _sequenceImage(3, 1, 1);
  static Future<SpriteAnimation> get idleUp => _sequenceImage(1, 4, 2);
  static Future<SpriteAnimation> get runUp => _sequenceImage(3, 4, 1);
}
