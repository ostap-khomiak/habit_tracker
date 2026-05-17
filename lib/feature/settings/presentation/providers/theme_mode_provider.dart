import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_provider.g.dart';

final settingsBoxProvider = Provider<Box>(
  (ref) => throw UnimplementedError('settingsBoxProvider must be overridden'),
);

const _themeModeKey = 'themeMode';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  late Box _box;

  @override
  ThemeMode build() {
    _box = ref.watch(settingsBoxProvider);
    final index =
        _box.get(_themeModeKey, defaultValue: ThemeMode.system.index) as int;
    return ThemeMode.values[index];
  }

  Future<void> setMode(ThemeMode mode) async {
    await _box.put(_themeModeKey, mode.index);
    state = mode;
  }
}
