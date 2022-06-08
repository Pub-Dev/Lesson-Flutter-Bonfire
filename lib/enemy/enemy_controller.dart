import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter_bonfire/generator_enemy/generator_enemy_controller.dart';

import '../abilities/slash_ability_sprite.dart';
import 'enemy_sprite.dart';

class EnemyController extends SimpleEnemy
    with
        ObjectCollision,
        AutomaticRandomMovement,
        UseStateController<GeneratorEnemyController> {
  EnemyController(
    Vector2 position,
  ) : super(
          position: position,
          size: Vector2(
            32,
            32,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: EnemySprite.idleRight,
            runRight: EnemySprite.runRight,
            idleLeft: EnemySprite.idleLeft,
            runLeft: EnemySprite.runLeft,
            eightDirection: true,
          ),
          speed: 50,
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
    super.update(dt);

    seeAndMoveToPlayer(
      closePlayer: (ally) {
        simpleAttackMelee(
          damage: 20,
          size: Vector2(32, 32),
          animationRight: SlashAbilitySprite.right,
          animationDown: SlashAbilitySprite.down,
          animationLeft: SlashAbilitySprite.left,
          animationUp: SlashAbilitySprite.up,
          withPush: true,
        );
      },
      radiusVision: 32 * 20,
      margin: 10,
      runOnlyVisibleInScreen: false,
    );
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 1,
      height: 2,
      align: const Offset(0, 0),
    );
    super.render(canvas);
  }

  @override
  void die() {
    controller.summon();
    removeFromParent();
    super.die();
  }
}
