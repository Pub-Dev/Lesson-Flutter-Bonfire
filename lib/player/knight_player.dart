import 'package:bonfire/bonfire.dart';
import 'package:lesson_flutter_bonfire/player/knight_sprite.dart';

import '../main.dart';

class KnightPlayer extends SimplePlayer with ObjectCollision {
  KnightPlayer()
      : super(
          position: Vector2(
            tileSize * 5,
            tileSize * 5,
          ),
          size: Vector2(
            tileSize,
            tileSize,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: KnightSprite.idleRight,
            runRight: KnightSprite.runRight,
            idleLeft: KnightSprite.idleLeft,
            runLeft: KnightSprite.runLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(20, 20),
            align: Vector2(6, 15),
          ),
        ],
      ),
    );
  }
}
