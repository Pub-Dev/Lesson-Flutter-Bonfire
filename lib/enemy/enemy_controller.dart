import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'enemy_sprite.dart';

class EnemyController extends SimpleEnemy
    with ObjectCollision, Lighting, AutomaticRandomMovement {
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
            idleUp: EnemySprite.idleUp,
            runUp: EnemySprite.runUp,
            idleDown: EnemySprite.idleDown,
            runDown: EnemySprite.runDown,
            eightDirection: true,
          ),
          speed: 30,
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

    setupLighting(
      LightingConfig(
        radius: 32 * 2,
        color: Colors.transparent,
        pulseCurve: Curves.bounceInOut,
        withPulse: true,
        blurBorder: 40,
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (ally) {
        simpleAttackMelee(
          damage: 20,
          size: Vector2(32, 32),
        );
      },
      radiusVision: 32 * 3,
      margin: 4,
    );

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(
      canvas,
      borderWidth: 1,
      height: 2,
      align: const Offset(0, -5),
    );
    super.render(canvas);
  }
}
