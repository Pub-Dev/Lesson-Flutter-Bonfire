import 'package:bonfire/bonfire.dart';

class SlashAbilitySprite {
  static Future<SpriteAnimation> _sequenceImage(
    String fileName,
    int amount,
    int row,
    int column,
  ) {
    return SpriteAnimation.load(
      'abilities/$fileName',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.1,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(16 * (column - 1), 16 * (row - 1)),
      ),
    );
  }

  static Future<SpriteAnimation> get left =>
      _sequenceImage('atack_effect_left.png', 3, 1, 1);
  static Future<SpriteAnimation> get right =>
      _sequenceImage('atack_effect_right.png', 3, 1, 1);
  static Future<SpriteAnimation> get up =>
      _sequenceImage('atack_effect_top.png', 3, 1, 1);
  static Future<SpriteAnimation> get down =>
      _sequenceImage('atack_effect_bottom.png', 3, 1, 1);
}
