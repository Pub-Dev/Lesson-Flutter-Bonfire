import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson_flutter_bonfire/player/player_controller.dart';

import 'enemy/enemy_controller.dart';
import 'main.dart';

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return BonfireTiledWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        directional: JoystickDirectional(
          color: Colors.orange,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            color: Colors.orange,
            margin: const EdgeInsets.all(40),
          ),
        ],
      ),
      map: TiledWorldMap(
        'maps/map.json',
        forceTileSize: const Size(48, 48),
      ),
      player: PlayerController(
        Vector2(tileSize * 17, tileSize * 10),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.5,
        smoothCameraEnabled: true,
        sizeMovementWindow: Vector2(
          tileSize * 2,
          tileSize * 2,
        ),
      ),
      showCollisionArea: false,
      components: [
        EnemyController(Vector2(tileSize * 5, tileSize * 5)),
        EnemyController(Vector2(tileSize * 18, tileSize * 18)),
        EnemyController(Vector2(tileSize * 18, tileSize * 5)),
      ],
    );
  }
}
