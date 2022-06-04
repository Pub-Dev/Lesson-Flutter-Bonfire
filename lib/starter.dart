import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'player/player_controller.dart';

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
      ),
      map: TiledWorldMap(
        'maps/island.json',
        forceTileSize: const Size(32, 32),
        objectsBuilder: {
          //'lamp': (properties) => Lamp(position: properties.position),
        },
      ),
      player: PlayerController(
        Vector2(16 * 32, 10 * 32),
      ),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1,
        smoothCameraEnabled: true,
        sizeMovementWindow: Vector2(
          32 * 2,
          32 * 2,
        ),
      ),
      showCollisionArea: false,
      lightingColorGame: Colors.black.withOpacity(0.9),
    );
  }
}
