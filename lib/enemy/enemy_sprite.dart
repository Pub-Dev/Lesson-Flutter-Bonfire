import 'package:bonfire/bonfire.dart';

class EnemySprite {
  static Future<SpriteAnimation> _sequenceImage(
      int amount, int row, int column) {
    return SpriteAnimation.load(
      'pokemons/golduck.png',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(64, 64),
        texturePosition: Vector2(64 * (column - 1), 64 * (row - 1)),
      ),
    );
  }

  static Future<SpriteAnimation> get idleLeft => _sequenceImage(1, 1, 2);
  static Future<SpriteAnimation> get idleRight => _sequenceImage(1, 2, 2);
  static Future<SpriteAnimation> get runLeft => _sequenceImage(3, 1, 1);
  static Future<SpriteAnimation> get runRight => _sequenceImage(3, 2, 1);
  static Future<SpriteAnimation> get idleDown => _sequenceImage(1, 3, 2);
  static Future<SpriteAnimation> get runDown => _sequenceImage(3, 3, 1);
  static Future<SpriteAnimation> get idleUp => _sequenceImage(1, 4, 2);
  static Future<SpriteAnimation> get runUp => _sequenceImage(3, 4, 1);
}
