import 'package:bonfire/bonfire.dart';
import 'package:lesson_flutter_bonfire/enemy/goblin_sprite.dart';
import 'package:lesson_flutter_bonfire/main.dart';

import '../abilities/slash_ability_sprite.dart';
import '../controllers/goblin_generator_controller.dart';

class GoblinEnemy extends SimpleEnemy
    with ObjectCollision, UseStateController<GoblinGeneratorController> {
  GoblinEnemy({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(32, 32),
          speed: 50,
          animation: SimpleDirectionAnimation(
            idleRight: GoblinSprite.idleRight,
            idleLeft: GoblinSprite.idleLeft,
            runRight: GoblinSprite.runRight,
            runLeft: GoblinSprite.runLeft,
          ),
          life: 50,
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

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationRight: SlashAbilitySprite.right,
          animationDown: SlashAbilitySprite.down,
          animationLeft: SlashAbilitySprite.left,
          animationUp: SlashAbilitySprite.up,
          direction: lastDirection,
          withPush: true,
        );
      },
      radiusVision: tileSize * 30,
    );

    super.update(dt);
  }

  @override
  void die() {
    controller.respawnMany();
    removeFromParent();
    super.die();
  }
}
