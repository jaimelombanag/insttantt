import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insttantt_test/app/inject_dependencies.dart';
import 'package:insttantt_test/app/my_app.dart';

void main() async {
  injectDependencies();
  runApp(const ProviderScope(child: MyApp()));
}
