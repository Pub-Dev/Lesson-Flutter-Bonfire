import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter_bonfire/player/player_sprite.dart';

import '../abilities/slash_ability_sprite.dart';

class PlayerController extends SimplePlayer
    with ObjectCollision, Lighting, JoystickListener {
  PlayerController(
    Vector2 position,
  ) : super(
          position: position,
          size: Vector2(
            32,
            32,
          ),
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSprite.idleRight,
            runRight: PlayerSprite.runRight,
            idleLeft: PlayerSprite.idleLeft,
            runLeft: PlayerSprite.runLeft,
            eightDirection: true,
          ),
          speed: 100,
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
        radius: 32 * 6,
        color: Colors.yellowAccent.withOpacity(0.1),
        pulseCurve: Curves.bounceInOut,
        withPulse: true,
        blurBorder: 40,
      ),
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
  void joystickAction(JoystickActionEvent event) {
    if (hasGameRef && !gameRef.camera.isMoving) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationRight: SlashAbilitySprite.right,
          animationDown: SlashAbilitySprite.down,
          animationLeft: SlashAbilitySprite.left,
          animationUp: SlashAbilitySprite.up,
          direction: lastDirection,
        );
      }
    }
  }

  @override
  void die() async {
    removeFromParent();
    gameRef.add(
      GameDecoration.withSprite(
        sprite: await PlayerSprite.die.then((value) => value.getSprite()),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.die();
  }
}
