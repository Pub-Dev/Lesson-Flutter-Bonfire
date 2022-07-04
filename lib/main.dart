import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter_bonfire/controllers/goblin_generator_controller.dart';
import 'package:lesson_flutter_bonfire/starter.dart';

const double tileSize = 32;

void main() {
  BonfireInjector.instance.put((i) => GoblinGeneratorController());

  runApp(
    const MaterialApp(
      home: Starter(),
    ),
  );
}
