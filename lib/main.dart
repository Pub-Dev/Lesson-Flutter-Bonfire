import 'package:bonfire/state_manager/bonfire_injector.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter_bonfire/generator_enemy/generator_enemy_controller.dart';
import 'package:lesson_flutter_bonfire/starter.dart';

const double tileSize = 32;

void main() {
  BonfireInjector().put((i) => GeneratorEnemyController());

  runApp(
    const MaterialApp(
      home: Starter(),
    ),
  );
}
