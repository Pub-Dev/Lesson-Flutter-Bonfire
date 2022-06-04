import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter_bonfire/player/player_sprite.dart';

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
            idleUp: PlayerSprite.idleUp,
            runUp: PlayerSprite.runUp,
            idleDown: PlayerSprite.idleDown,
            runDown: PlayerSprite.runDown,
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
        radius: 32 * 2,
        color: Colors.transparent,
        pulseCurve: Curves.bounceInOut,
        withPulse: true,
        blurBorder: 40,
      ),
    );
  }
}
